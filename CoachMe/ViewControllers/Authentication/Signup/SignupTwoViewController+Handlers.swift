//
//  SignupTwoViewController+Handlers.swift
//  CoachMe
//
//  Created by ashley canty on 1/26/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension SignupTwoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let url = info[UIImagePickerController.InfoKey.imageURL] as? URL
        var selectedImageFromPicker: UIImage?
        
        // edited image
        if info[UIImagePickerController.InfoKey.editedImage] != nil {
            selectedImageFromPicker = (info[UIImagePickerController.InfoKey.editedImage] as! UIImage)
            if let imageSource = CGImageSourceCreateWithURL(url! as CFURL, nil) {
                if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? Dictionary<String, AnyObject> {
                    guard imageProperties["PixelHeight"] != nil else { print("Error retrieving height")
                        return
                    }
                    guard imageProperties["PixelWidth"] != nil else {
                        print("Error retrieving width")
                        return
                    }
                }
            }
            
            // original image
        } else if info[UIImagePickerController.InfoKey.originalImage] != nil {
            selectedImageFromPicker = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
            if let imageSource = CGImageSourceCreateWithURL(url! as CFURL, nil) {
                if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? Dictionary<String, AnyObject> {
                    guard imageProperties["PixelHeight"] != nil else { print("Error retrieving height")
                        return
                    }
                    guard imageProperties["PixelWidth"] != nil else {
                        print("Error retrieving width")
                        return
                    }
                }
            }
        }
        
        if let selectedImage = selectedImageFromPicker {
            userImage.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    func createUser() {
        view.addSubview(SignupTwoViewController.displaySpinner(onView: view))
        
        guard let firstName = firstName, let lastName = lastName, let email = email.text, let password = password.text, let role = selectedRole else {
            print("Invalid input")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let uid = user?.user.uid else {
                return
            }

            // Successfully authenticated user
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference(withPath: "gs://coachme-c9e7e.appspot.com/gs://gameofchat-61fd8.appspot.com/").child("_images").child("\(imageName).jpg")
            if let image = self.userImage.image, let uploadData = image.jpegData(compressionQuality: 0.1) {
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, err) in
                    if err != nil {
                        print(err!)
                        return
                    }
                    
                    let location = ""
                    var dateJoined = ""
                    let averageRating = "0"
                    let totalRatings = "0"
                    let bio = ""
                    
                    
                    let now = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMMM yyyy"
                    dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
                    let MonthAndYear = dateFormatter.string(from: now)
                    print(now)
                    print(MonthAndYear)
                    
                    dateJoined = MonthAndYear
                    
                    storageRef.downloadURL(completion: { (url, err) in
                        let values = ["firstName": firstName,"lastName": lastName, "email": email, "profileImageUrl": url!.absoluteString, "role": role, "dateJoined": dateJoined, "bio": bio, "totalRatings": totalRatings,"averageRating": averageRating, "location": location]
                        if CoachMeWebServices().registerUserIntoDatabaseWithUID(uid, values) == true {
                            SignupTwoViewController.removeSpinner(spinner: self.view)
                            //            AppDelegate().loginNavigation(self.navigationController!)
                        } else {
                            let alert = UIAlertController(title: "Registration failed.", message: "There was an error storing your information.", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                            alert.addAction(action)
                            self.present(alert, animated: true, completion: nil)
                        }
                    })
                })
            }
        }
    }
    
   
}
