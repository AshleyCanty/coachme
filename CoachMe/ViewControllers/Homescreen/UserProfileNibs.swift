//
//  UserProfileNibs.swift
//  CoachMe
//
//  Created by ashley canty on 12/29/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import Foundation
import UIKit

class UserProfileNibs {
    let userDefaults = UserDefaults.standard
    let nibUserIntro = UINib.init(nibName: "UserIntroTableViewCell", bundle: nil)
    let nibAboutMe = UINib.init(nibName: "AboutMeViewCell", bundle: nil)
    let nibReviews = UINib.init(nibName: "ReviewsTableViewCell", bundle: nil)
    let nibPhotos = UINib.init(nibName: "PhotosTableViewCell", bundle: nil)
    let nibAddReview = UINib.init(nibName: "AddReviewTableViewCell", bundle: nil)
    let nibSeeAllReviews = UINib.init(nibName: "SeeMoreTableViewCell", bundle: nil)
    let nibServices = UINib.init(nibName: "ServicesTableViewCell", bundle: nil)
    let nibVideo = UINib.init(nibName: "VideoTableViewCell", bundle: nil)
}
