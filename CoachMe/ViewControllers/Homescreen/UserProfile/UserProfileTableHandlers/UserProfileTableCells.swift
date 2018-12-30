//
//  UserProfileTableCells.swift
//  CoachMe
//
//  Created by ashley canty on 12/30/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import Foundation
import UIKit

extension UserProfileViewController {
    
    func getProfileCells(_ indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            cell.profileBtn.tag = indexPath.row
            cell.profileBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.servicesBtn.tag = indexPath.row
            cell.servicesBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.reviewsBtn.tag = indexPath.row
            cell.reviewsBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutMeViewCell", for: indexPath) as! AboutMeViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            cell.label.text = StaticStrings.bio
            if StaticStrings.headlines[1].text != "" {
                cell.textView.text = StaticStrings.headlines[1].text
            } else {
                cell.textView.text = StaticStrings.emptySection
            }
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as! VideoTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            
            let videoType = "youtube"
            switch videoType {
            case "youtube":
                Helpers().createYoutubeVideo(cell.webView, videoCode)
            case "custom":
                if (cell.webView != nil) {
                    cell.webView.removeFromSuperview()
                }
                let videoPlayer = Helpers().createCustomVideo("video")
                present(videoPlayer, animated: true, completion: {
                    videoPlayer.player?.play()
                })
            default:
                print("User has no videos")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            cell.viewButton.addTarget(self, action: #selector(showPhotos), for: .touchUpInside)
            return cell
        }
    }
    
    func getServicesCells(_ indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            cell.profileBtn.tag = indexPath.row
            cell.profileBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.servicesBtn.tag = indexPath.row
            cell.servicesBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            cell.reviewsBtn.tag = indexPath.row
            cell.reviewsBtn.addTarget(self, action: #selector(reloadTableData), for: .touchUpInside)
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell") as! ServicesTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
    }
    
    func getReviewsCells(_ indexPath: IndexPath) -> UITableViewCell{
        
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddReviewTableViewCell", for: indexPath) as! AddReviewTableViewCell
            cell.addReviewButton.tag = indexPath.row
            cell.addReviewButton.addTarget(self, action: #selector(addReviewClicked), for: .touchUpInside)
            return cell
        case 2,3,4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
            cell.reviewText.text = headlines[indexPath.row-2].text
            cell.reviewAuthor.text = headlines[indexPath.row-2].title
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SeeMoreTableViewCell", for: indexPath) as! SeeMoreTableViewCell
            cell.seeAllReviewsButton.setTitle(LinkTitles.SeeReviewsButton, for: .normal)
            cell.seeAllReviewsButton.tag = indexPath.row
            cell.seeAllReviewsButton.addTarget(self, action: #selector(pushToSeeAllReviewsView), for: .touchUpInside)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
    }
}
