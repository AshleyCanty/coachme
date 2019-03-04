//
//  UserInfo.swift
//  CoachMe
//
//  Created by ashley canty on 12/12/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

// https://stackoverflow.com/questions/47508782/nsobject-setvaluesforkeys-coding-complaint-error-in-swift-4-0-2

@objcMembers class User: NSObject {
    var firstName: String?
    var lastName: String?
    var userId: String?
    var password: String?
    var email: String?
    var profileImageUrl: String?
    var number: String?
    var role: String?
    var location: String?
    var dateJoined: String?
    var followers: String?
    var following: String?
    var averageRating: String?
    var bio: String?
    var services: [String]?
    var baseRate: String?
    var userImage: UIImage?
    var gallery: [UIImage]?
}
