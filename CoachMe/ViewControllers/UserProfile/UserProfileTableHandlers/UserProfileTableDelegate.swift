//
//  UserProfileTableDelegate.swift
//  CoachMe
//
//  Created by ashley canty on 12/30/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import Foundation
import UIKit

extension UserProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.setClearBackground()
        
        if animationFlag == true {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -10, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0
            UIView.animate(withDuration: 0.45, animations: {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1.0
            })
        }
        if userDefaults.string(forKey: "tab") == "profile" {
            if indexPath.row == 1 {
                animationFlag = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tab = userDefaults.string(forKey: "tab")
        
        switch tab {
        case "profile":
            return 4
        case "services":
            return 2
        case "reviews":
            return 6
        default:
            return 1
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tab = userDefaults.string(forKey: "tab")
        
        switch tab {
        case "profile":
            if indexPath.row == 0 {
                return UserIntroTableViewCell().userIntroCellHeight
            } else if indexPath.row == 1 {
                return AboutMeViewCell().aboutCellHeight
                
            } else if indexPath.row == 2 {
                return 250
            } else {
                return PhotosTableViewCell().photosCellHeight
            }
        case "services":
            if indexPath.row == 0 {
                return UserIntroTableViewCell().userIntroCellHeight
            } else {
                return ServicesTableViewCell().servicesCellHeight
            }
        case "reviews":
            if indexPath.row == 0 {
                return UserIntroTableViewCell().userIntroCellHeight
            } else if indexPath.row == 1 {
                return AddReviewTableViewCell().buttonCellHeight
            } else if indexPath.row == 5{
                return SeeMoreTableViewCell().seeMoreCellHeight
            } else {
                return ReviewsTableViewCell().reviewsCellHeight
            }
        default:
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tab = userDefaults.string(forKey: "tab")
        var cell: UITableViewCell
        
        switch tab {
        case "profile":
            cell = getProfileCells(indexPath)
            return cell
        case "services":
            cell = getServicesCells(indexPath)
            return cell
        case "reviews":
            cell = getReviewsCells(indexPath)
            return cell
        default:
            cell = getProfileCells(indexPath)
            return cell
        }
    }
}
