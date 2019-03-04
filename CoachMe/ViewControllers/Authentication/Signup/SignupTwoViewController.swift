//
//  SignupTwoViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/5/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import Firebase

class SignupTwoViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var cameraImage: UIImageView!
    
    var selectedRole: String?
    var firstName: String?
    var lastName: String?
    var socialUserId: String = ""
    var socialEmail: String = ""
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    var spinnerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        setupSpinner()
        self.title = "Registration"
        view.backgroundColor = UIColor.clear
        cameraImage.layer.cornerRadius = cameraImage.frame.width/2
        cameraImage.layer.masksToBounds = true
        view.insertSubview(view.setGradientBackground(Colors().leftGradientColor, Colors().rightGradientColor), at: 0)
        
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = UIColor.white
        
    }
    
    func setupSpinner() {
        spinnerView = UIView.init(frame: view.frame)
        spinnerView.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 0.6)
        spinnerView.addSubview(spinner)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.center = view.center
    }
    
    @IBAction func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        present(picker, animated: true, completion: nil)
        picker.allowsEditing = true
        picker.delegate = self
    }
    
    @IBAction func verifyTextFieldsAndBeginRegistration(_ sender: Any) {
        guard let email = email.text, let password = password.text, let confirmPassword = confirmPassword.text else {
            print("Invalid input when verifying")
            return
        }
        
        var emptyField = ""
        
        if email.isEmpty {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpThreeViewController") as! SignUpThreeViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            emptyField = "email"
            emptyTextFieldAlert(emptyField)
        } else if email.isEmailValid() == false {
            InvalidEmailAlert()
        } else if password.isEmpty {
            emptyField = "password"
            emptyTextFieldAlert(emptyField)
        } else if confirmPassword.isEmpty {
            emptyField = "confirmation password"
            emptyTextFieldAlert(emptyField)
        } else if password != confirmPassword {
            matchPasswordsAlert()
        } else {
//            createUser()
            let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpThreeViewController") as! SignUpThreeViewController
            vc.user.firstName = firstName
            vc.user.lastName = lastName
            vc.user.role = selectedRole
            vc.user.password = password
            vc.userImage = userImage.image
            
            if socialUserId != "" && socialEmail != "" {
                vc.user.userId = socialUserId
                vc.user.email = socialEmail
            } else {
                vc.user.email = email
                vc.user.userId = NSUUID().uuidString
            }
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func InvalidEmailAlert() {
        let alert = UIAlertController(title: "Invalid email", message: "Please enter a valid email.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func matchPasswordsAlert() {
        let alert = UIAlertController(title: "Mismatch passwords", message: "Please make sure your passwords match.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func emptyTextFieldAlert(_ field: String) {
        let alert = UIAlertController(title: "Empty Field", message: "Please fill in your \(field).", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func setText(){
//        name.layer.cornerRadius = 5
//        name.layer.borderWidth = 1
//        name.layer.borderColor = UIColor.clear.cgColor
//        email.layer.cornerRadius = 5
        password.isSecureTextEntry = true
//        password.layer.cornerRadius = 5
        confirmPassword.isSecureTextEntry = true
    }
}


