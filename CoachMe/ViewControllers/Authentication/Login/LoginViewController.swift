//
//  LoginViewController.swift
//  CoachMe
//
//  Created by ashley canty on 11/19/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import Firebase



class LoginViewController: UIViewController {

    var titleTopAnchor: NSLayoutConstraint?
    var titleCenterYAnchor: NSLayoutConstraint?
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupLink: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllText()
        navigationController?.navigationBar.tintColor = Colors().lightGreen
        UINavigationBar.appearance().barTintColor = Colors().darkGreyBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
    @IBAction func shortcut(_ sender: Any) {
        AppDelegate().loginNavigation(navigationController!)
        guard let email = email.text, let password = password.text else {
            print("Invalid input")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = user?.user.uid else {
                return
            }
            
            // Successfully authenticated user
            let ref = Database.database().reference(fromURL: "https://coachme-c9e7e.firebaseio.com/")
            let usersReference = ref.child("user").child(uid)
            let values = ["email": email, "password": password]
            usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    print(err)
                    return
                }
                print("Successfully saved user to Firebase DB")
            })
        }
    }
    
    
    @IBAction func startSignup(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignupOneViewController") as! SignupOneViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func setAllText(){
        let userImage = UIImage(named: "user.pdf")
        let passwordImage = UIImage(named: "locked.pdf")
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

