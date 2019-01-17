//
//  UserProfileTableDataSource.swift
//  CoachMe
//
//  Created by ashley canty on 12/30/18.
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

extension UserProfileViewController: UITableViewDataSource {
    
    func setTableView(){
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -50, right: 0)
        self.tableView.dataSource = self as UITableViewDataSource
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.delaysContentTouches = false
        self.tableView.register(UserProfileNibs().nibUserIntro, forCellReuseIdentifier: "UserIntroTableViewCell")
        self.tableView.register(UserProfileNibs().nibAboutMe, forCellReuseIdentifier: "AboutMeViewCell")
        self.tableView.register(UserProfileNibs().nibReviews, forCellReuseIdentifier: "ReviewsTableViewCell")
        self.tableView.register(UserProfileNibs().nibPhotos, forCellReuseIdentifier: "PhotosTableViewCell")
        self.tableView.register(UserProfileNibs().nibAddReview, forCellReuseIdentifier: "AddReviewTableViewCell")
        self.tableView.register(UserProfileNibs().nibSeeAllReviews, forCellReuseIdentifier: "SeeMoreTableViewCell")
        self.tableView.register(UserProfileNibs().nibServices, forCellReuseIdentifier: "ServicesTableViewCell")
        self.tableView.register(UserProfileNibs().nibVideo, forCellReuseIdentifier: "VideoTableViewCell")
    }
}
