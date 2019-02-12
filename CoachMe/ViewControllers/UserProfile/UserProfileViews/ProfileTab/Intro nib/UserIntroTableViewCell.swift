//
//  UserIntroTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/12/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class UserIntroTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var startChatButton: UIButton!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var dateJoined: UILabel!
    @IBOutlet weak var ageLocation: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var servicesBtn: UIButton!
    @IBOutlet weak var reviewsBtn: UIButton!
    
    let userDefaults = UserDefaults.standard
    let userIntroCellHeight = CGFloat(integerLiteral: 360)
    let selectedButtonBorder: UIView = {
        let view = UIView()
        view.frame.size.height = 3
        view.backgroundColor = Colors().lightGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        username.sizeToFit()
        containerView.addShadows()
        containerView.layer.shadowRadius = 8
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        tap.delegate = self
        view.addSubview(selectedButtonBorder)
        selectedButtonBorder.frame.size.width = profileBtn.frame.width
        selectedButtonBorder.frame.origin.y = (view.bounds.maxY + profileBtn.bounds.maxY - 0.5)
        addBorderToSelectedButton([profileBtn, servicesBtn, reviewsBtn])
        
        imageBackground.blurryImageBackground()
        userImage.makeRoundedUserProfileImage()
        userImage.isUserInteractionEnabled = true
        userImage.addGestureRecognizer(tap)
        profileBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        reviewsBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        role.roundedCorners()
//        setChatAndAddFriendButtons()
    }
    
    func addBorderToSelectedButton(_ buttons: [UIButton]) {
        var borderX = self.selectedButtonBorder.frame.origin.x
        let buttonX = buttons[0].frame.origin.x
        let selectedButton = buttons[0]
        
        // wont animate becasue tableview is refreshing
        
        selectedButton.setTitleColor(Colors().lightGreen, for: .normal)
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut], animations: {
            
            self.selectedButtonBorder.frame.origin.x = selectedButton.frame.origin.x
            borderX = buttonX
            //                self.layoutSubviews()
        }, completion: nil)
        
        buttons[1].setTitleColor(UIColor.white, for: .normal)
        buttons[2].setTitleColor(UIColor.white, for: .normal)
        
        //        add underline view as subview to
        //        the outermost-containing view,
        //        start with transform coordinates (x: 0, y: profile.bounds.height)
        //        use transform to move uiview to same bounds as the button
        //        whenever the button is pressed
    }
    
    func setChatAndAddFriendButtons(){

        let startChatImage: UIImage = {
            let image = UIImage(named: "forward-arrow")!
            
            return image
        }()
        
        startChatButton.layer.cornerRadius = startChatButton.frame.width/2
        startChatButton.layer.masksToBounds = true
        startChatButton.setImage(startChatImage, for: .normal)
        startChatButton.imageView?.contentMode = .scaleAspectFill
        startChatButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
    }
    
    @IBAction func viewProfile(_ sender: Any) {
//        Helpers().changeBGColor([profileBtn, servicesBtn, reviewsBtn])
        Helpers().setProfileTab("profile", "tab")
        addBorderToSelectedButton([profileBtn, servicesBtn, reviewsBtn])
    }
    
    @IBAction func viewService(_ sender: Any) {
//        Helpers().changeBGColor([servicesBtn, reviewsBtn, profileBtn])
        Helpers().setProfileTab("services", "tab")
        addBorderToSelectedButton([servicesBtn, profileBtn, reviewsBtn])
    }
    
    @IBAction func viewReviews(_ sender: Any) {
//        Helpers().changeBGColor([reviewsBtn, profileBtn, servicesBtn])
        Helpers().setProfileTab("reviews", "tab")
        addBorderToSelectedButton([reviewsBtn, profileBtn, servicesBtn])
        
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

extension UIButton {
   
}

extension UILabel {
    func roundedCorners() {
        layer.cornerRadius = 3
        layer.masksToBounds = true
    }
}
extension UIImageView {
    
    func roundedImage() {
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }
    
    func blurryImageBackground() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentMode = .scaleAspectFill
        addSubview(blurEffectView)
    }
}
