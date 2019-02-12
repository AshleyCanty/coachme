//
//  CoachMeWebServices.swift
//  CoachMe
//
//  Created by ashley canty on 2/12/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class CoachMeWebServices {
    
    
    
    func registerUserIntoDatabaseWithUID(_ uid: String,_ values: [String: String]) -> Bool {
        let ref = Database.database().reference(fromURL: "https://coachme-c9e7e.firebaseio.com/")
        let usersReference = ref.child("users").child(uid)
        var flag = Bool()
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err!)
                flag = false
                return
            }
            flag = true
            print("Successfully saved user to Firebase DB")
        })
        return flag
    }
}
