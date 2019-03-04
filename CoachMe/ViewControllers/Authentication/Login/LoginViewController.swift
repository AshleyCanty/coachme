//
//  LoginViewController.swift
//  CoachMe
//
//  Created by ashley canty on 11/19/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupLink: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    var spinnerView: UIView!
    var spinner: UIActivityIndicatorView!
    
    var socialEmail: String = ""
    var socialUserId: String = ""
    var firstName: String = ""
    var lastName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setAllText()
        setupButtons()
        setupSpinner()
        setupNavbarAndMainView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        email.text = ""
        password.text = ""
    }
    
    func setupNavbarAndMainView(){
        view.backgroundColor = UIColor.clear
        view.insertSubview(view.setGradientBackground(Colors().leftGradientColor, Colors().rightGradientColor), at: 0)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = Colors().solidDarkBackgroundGreen
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = Colors().solidDarkBackgroundGreen
        
    }
    
    func setupSpinner() {
        spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinnerView = UIView.init(frame: view.frame)
        spinnerView.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0.5)
        spinnerView.addSubview(spinner)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.center = view.center
    }
    
    func checkUsersInFirebaseDB() -> Bool {
        var flag: Bool = false
        let userId = AccessToken.current?.userId
        Database.database().reference().child("users").queryEqual(toValue: NSString(string: "user_id")).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject] {
                for each in dictionary {
                    let key = each.key
                    let match = each.value["user_id"]
                    print("KEY AND MATCH: \(key) \(match)")
                    flag = true
                    
                }
            } else {
                print("USER IS NEW.")
                flag = false
            }
        }
        return flag
    }

    func setupButtons(){
        let fbImage = UIImage(named: "facebook")
        fbButton.setImage(fbImage, for: .normal)
        fbButton.contentMode = .scaleAspectFit
        fbButton.layer.cornerRadius = fbButton.frame.width/2
        fbButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let googleImage = UIImage(named: "google-logo")
        googleButton.setImage(googleImage, for: .normal)
        googleButton.contentMode = .scaleAspectFit
        googleButton.layer.cornerRadius = googleButton.frame.width/2
        googleButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    
    @IBAction func facebookLogin(_ sender: UIButton) {
        let manager = LoginManager()
        manager.logOut()
        manager.logIn(readPermissions: [.publicProfile, .email], viewController: self) { (result) in
            switch result {
            case .cancelled:
                
                print("User cancelled login")
                break
                
            case .failed(let error) :
                
                print("Login error with  = \(error.localizedDescription)")
                let alert = UIAlertController(title: "Error logging into Facebook", message: "There was an error logging you into Facebook. Please try again.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                break
            
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                
                print(accessToken.authenticationToken, accessToken.userId)
                if self.checkUsersInFirebaseDB() == true {
                    AppDelegate().loginNavigation(self.navigationController!)
                } else {
                    let userinfo = self.getUserProfile()
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupOneViewController") as! SignupOneViewController
                    
                    vc.userId = self.socialUserId
                    vc.email = self.socialEmail
                    vc.socialFirstName = self.firstName
                    vc.socialLastName = self.lastName
                   
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                break
            }
        }
    }
    
    @IBAction func googleLogin(_ sender: Any) {
    
    }
    
    func getUserProfile(){
        
        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: GraphAPIVersion.defaultVersion)
        
        graphRequest.start { (response, result) in
            
            switch result {
            case .success(let response):
                self.socialUserId = response.dictionaryValue!["id"] as! String
                self.socialEmail = response.dictionaryValue!["email"] as! String
                self.firstName = response.dictionaryValue!["first_name"] as! String
                self.lastName = response.dictionaryValue!["last_name"] as! String

                break
            case .failed(let error):
                print("we have error fetching user profile: \(error)")
            }
        }
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = email.text, let password = password.text else {
            print("Invalid input")
            return
        }
        
//        1) empty fields, 2) invalid email, 3) incorrect entry
        
        if email == "" || password == "" {
            let alert = UIAlertController(title: "Invalid entry", message: "Please provide an email and password to login.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        if email.isEmailValid() == true {
            view.addSubview(spinnerView)
            if Auth.auth().currentUser != nil {
                Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
                    if err != nil {
                        print(err!)
                        let alert = UIAlertController(title: "Failed attempt", message: "Either the email or password is incorrect. Please try again.", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: {
                            DispatchQueue.main.async {
                                self.spinnerView.removeFromSuperview()
                            }
                        })
                        return
                    } else {
                        print("Signed IN")
                        DispatchQueue.main.async {
                            self.spinnerView.removeFromSuperview()
                        }
                        AppDelegate().loginNavigation(self.navigationController!)
                    }
                    // otherwise successfully signed user in
                }
            } else {
                // if current user is not nil then signout
                try! Auth.auth().signOut()
            }
        } else {
            let alert = UIAlertController(title: "Invalid email", message: "Please enter a valid email.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func startSignup(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignupOneViewController") as! SignupOneViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func setAllText(){
//        let userImage = UIImage(named: "user.pdf")
//        let passwordImage = UIImage(named: "locked.pdf")
        email.placeholder = StaticStrings.email
        password.placeholder = StaticStrings.password
        
        email.setPadding()
        password.setPadding()
        password.isSecureTextEntry = true
        mainTitle.attributedText = Helpers().changeTextColor(StaticStrings.coachMe, "coach", "Me")
    }
    
}

extension UITextField{
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func placeholderEdit(_ text: String){
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 120.0/255.0, green:176.0/255.0, blue: 186.0/255.0, alpha: 1.0)])
    }
    
    func addLeftImage(_ img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 15, y: 0.0, width: img.size.width, height: img.size.height))
        
        leftImageView.image = img
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 25))
        view.addSubview(leftImageView)
        self.leftView = view
        self.leftViewMode = .always
    }
    
}

