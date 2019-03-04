//
//  SignUpThreeViewController.swift
//  CoachMe
//
//  Created by ashley canty on 2/12/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Firebase

class SignUpThreeViewController: UIViewController {
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var containerView: UIView!
    var user = User()
    var userImage: UIImage?
    
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    var spinnerView: UIView!
    
    override func viewDidLoad() {
        customizeFinishButton()
        view.backgroundColor = UIColor.clear
        view.insertSubview(view.setGradientBackground(Colors().leftGradientColor, Colors().rightGradientColor), at: 0)
        setupSpinner()
        
        print(user.email, user.userId, user.firstName)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeSignup(){
        createUser()
        AppDelegate().loginNavigation(self.navigationController!)
        
    }
    
    func setupSpinner() {
        spinnerView = UIView.init(frame: view.frame)
        spinnerView.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 0.6)
        spinnerView.addSubview(spinner)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.center = view.center
    }
    
    func loadZipcode() {
        if let zipcode = zipcode.text {
            
            // Use google geo location to confirm
            
            // if successful
            // call ----> locationSuccessfullyLoaded()
            
            
            // if failed, present alert
            // call ----> failedToFindZipcode()
        }
    }
    
    func loadCityState() {
        if let city = city.text, let state = state.text {
            
            // Use google geo location to confirm
            
            
            // if successful
            // call ----> locationSuccessfullyLoaded()
            
            
            // if failed, present alert
            // call ----> failedToFindCityState()
            
        }
    }
    
    func locationSuccessfullyLoaded() -> Bool {
        
        let flag = Bool()
        // confirm with with IBDesignable -- func task!
        // need to confirm locations so that the
        // data can be stored in the database under the registering user
        
        return flag
    }
    
    func failedToFindZipcode() {
        let alert = UIAlertController(title: "Failed attempt", message: "We failed to verify the zipcode. Please enter a valid zipcode.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            self.zipcode.text = ""
            self.city.text = ""
            self.state.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func failedToFindCityState() {
        let alert = UIAlertController(title: "Failed attempt", message: "We failed to verify the city and state. Please enter valid information.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            self.zipcode.text = ""
            self.city.text = ""
            self.state.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func customizeFinishButton(){
        finishButton.layer.borderColor = Colors().lightGreen.cgColor
        finishButton.layer.borderWidth = 1
        finishButton.backgroundColor = UIColor.clear
        finishButton.layer.cornerRadius = 15
    }
    
    func registerUserIntoDatabaseWithUID(_ uid: String,_ values: [String: String]) {
        let ref = Database.database().reference(fromURL: "https://coachme-c9e7e.firebaseio.com/")
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                let alert = UIAlertController(title: "Registration failed.", message: err!.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: {
                    DispatchQueue.main.async {
                        self.spinnerView.removeFromSuperview()
                    }
                })
                return
            }
            DispatchQueue.main.async {
                self.spinnerView.removeFromSuperview()
            }
            print("Successfully saved user to Firebase DB")
            AppDelegate().loginNavigation(self.navigationController!)
            
        })
    }
    
    func createUser() {
        view.addSubview(spinnerView)
        guard let userImage = userImage, let firstName = user.firstName, let lastName = user.lastName, let userId = user.userId, let email = user.email, let password = user.password, let role = user.role else {
            print("Invalid input")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
            if err != nil {
                print(err!)
                let alert = UIAlertController(title: "Registration failed.", message: err!.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: {
                    DispatchQueue.main.async {
                        self.spinnerView.removeFromSuperview()
                    }
                })
                return
            }
            guard let uid = user?.user.uid else {
                return
            }
            
            // Successfully authenticated user
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference(withPath: "gs://coachme-c9e7e.appspot.com/").child("_images").child("\(imageName).jpg")
            if let image = self.userImage, let uploadData = image.jpegData(compressionQuality: 0.1) {
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, err) in
                    if err != nil {
                        print(err!)
                        return
                    }
                    
                    
                    //---------TODO---------//
                    let averageRating = "0"
                    let totalRatings = "0"
                    let location = ""
                    let bio = ""
                    var dateJoined = ""
                    var userId = ""
      

                    let now = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMMM yyyy"
                    dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
                    
                    let MonthAndYear = dateFormatter.string(from: now)
                    dateJoined = MonthAndYear
                    
                    storageRef.downloadURL(completion: { (url, err) in
                        let values = ["firstName": firstName,"lastName": lastName, "userId": userId, "email": email, "profileImageUrl": url!.absoluteString, "role": role, "dateJoined": dateJoined, "bio": bio, "totalRatings": totalRatings,"averageRating": averageRating, "location": location]
                        self.registerUserIntoDatabaseWithUID(uid, values)
                    })
                })
            }
        }
    }

}
