//
//  UserIntroTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/12/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class UserIntroTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var ageLocation: UILabel!
    @IBOutlet weak var follower_sum: UILabel!
    @IBOutlet weak var following_sum: UILabel!
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var servicesBtn: UIButton!
    @IBOutlet weak var reviewsBtn: UIButton!
    
    let userDefaults = UserDefaults.standard
    let userIntroCellHeight = CGFloat(integerLiteral: 360)
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Helpers().makeRounded(userImage)
        username.sizeToFit()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        tap.delegate = self
        userImage.isUserInteractionEnabled = true
        userImage.addGestureRecognizer(tap)
        profileBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        reviewsBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.addShadows()
    }
    
    @IBAction func viewProfile(_ sender: Any) {
        Helpers().changeBGColor([profileBtn, servicesBtn, reviewsBtn])
        Helpers().setProfileTab("profile", "tab")
    }
    
    @IBAction func viewService(_ sender: Any) {
        Helpers().changeBGColor([servicesBtn, reviewsBtn, profileBtn])
        Helpers().setProfileTab("services", "tab")
    }
    
    @IBAction func viewReviews(_ sender: Any) {
        Helpers().changeBGColor([reviewsBtn, profileBtn, servicesBtn])
        Helpers().setProfileTab("reviews", "tab")
       
        let notificationName = NSNotification.Name("notificationTableReload")
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    
    @objc func tappedImage(_ sender: Any) {
        let gesture = sender as! UIGestureRecognizer
        if let imageView = gesture.view as? UIImageView {
            
            let newImageView = UIImageView(image: imageView.image)
            newImageView.frame = UIScreen.main.bounds
            newImageView.backgroundColor = UIColor.black
            newImageView.contentMode = .scaleAspectFit
            newImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
            tap.delegate = self
            newImageView.addGestureRecognizer(tap)
            window?.rootViewController!.view.addSubview(newImageView)
            window?.rootViewController!.navigationController?.isNavigationBarHidden = true
            window?.rootViewController!.tabBarController?.tabBar.isHidden = true
        }
    }
    
    @objc func dismissScreen(_ sender: UITapGestureRecognizer) {
        window?.rootViewController!.navigationController?.isNavigationBarHidden = false
        window?.rootViewController!.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
