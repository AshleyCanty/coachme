//
//  UserProfileTableCells.swift
//  CoachMe
//
//  Created by ashley canty on 12/30/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import Foundation
import Firebase
import UIKit

extension UserProfileViewController {
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
//        cell.layer.transform = rotationTransform
//        cell.alpha = 0.5
//
//        UIView.animate(withDuration: 1.0, animations: {
//            cell.layer.transform = CATransform3DIdentity
//            cell.alpha = 1.0
//        })
//        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -10, 0)
//        cell.layer.transform = rotationTransform
//        cell.alpha = 0
//        UIView.animate(withDuration: 0.75, animations: {
//            cell.layer.transform = CATransform3DIdentity
//            cell.alpha = 1.0
//        })
//    }

    func fetchUserFromDatabaseWithUid() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Could not retrieve user.")
            return
        }
        
        print("MIGHT PRINT ERROR TRYING TO GET USER")
        Database.database().reference().child("users").child(uid).observe(DataEventType.value) { (snapshot) in
            print(snapshot)
            
        }
    }
    
    func getProfileImageUrl() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("failed to get info")
            return
        }
        Database.database().reference().child("users").child(uid).observe(.value) { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
//                self.user.setValuesForKeys(dictionary)
                print(dictionary)
                self.user.firstName = (dictionary["firstName"] as! String)
                self.user.lastName = (dictionary["lastName"] as! String)
                self.user.email = (dictionary["email"] as! String)
                self.user.profileImageUrl = (dictionary["profileImageUrl"] as! String)
                self.user.role = (dictionary["role"] as! String)
                self.user.dateJoined = (dictionary["dateJoined"] as! String)
                self.user.averageRating = (dictionary["dateJoined"] as! String)
                // Use dispatch to run on background thread and prevent crashing
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        // dont return in closure becasue they are meant to be void, try again with a fresh mind
    }
    
    func getProfileCells(_ indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntroTableViewCell", for: indexPath) as! UserIntroTableViewCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            
            
            if let profileImageUrl = user.profileImageUrl {
                cell.userImage.loadImageUsingCacheWithUrlString(profileImageUrl)
                cell.imageBackground.loadImageUsingCacheWithUrlString(profileImageUrl)
            }
            
            if let role = user.role {
                cell.role.getColorOfUserRole(role)
            }
            
            if let dateJoined = user.dateJoined {
                cell.dateJoined.text = dateJoined
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM yyyy"
                let newdate = formatter.string(from: date)
            }
            if let name = user.firstName {
                cell.username.text = name
            }
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
            cell.label.text = "About me"
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
//                cell.webView.scrollView.layer.masksToBounds = true
//                cell.webView.scrollView.layer.cornerRadius = 8.0
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

extension UILabel {
    func getColorOfUserRole(_ str: String){
        if str == "Mentor" {
            backgroundColor = Colors().lightGreen
            return
        }
        backgroundColor = Colors().orange
    }
}
