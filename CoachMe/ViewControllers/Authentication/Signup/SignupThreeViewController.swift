//
//  SignupThreeViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/5/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class SignupThreeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var circleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(StaticStrings.headlines.count)
        username.layer.borderColor = UIColor.clear.cgColor
        password.layer.borderColor = UIColor.clear.cgColor
        confirmPassword.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    
    @IBAction func register(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Homescreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera not available")
                let alert = UIAlertController(title: "No Camera", message: "No camera was found", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        circleImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
