//
//  TabBarViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/7/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboardOne = UIStoryboard(name: "UserProfile", bundle: nil)
        let homeView = storyboardOne.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        addAttributes(homeView, UIImage(named: "home-white")!,UIImage(named: "home-grey")!)

        let storyboardTwo = UIStoryboard(name: "UserProfile", bundle: nil)
        let inboxView = storyboardTwo.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        addAttributes(inboxView, UIImage(named: "inbox-white")!,UIImage(named: "inbox-grey")!)
        
        let storyboardThree = UIStoryboard(name: "SearchScreen", bundle: nil)
        let searchView = storyboardThree.instantiateViewController(withIdentifier: "SearchScreenViewController") as! SearchScreenViewController
        addAttributes(searchView, UIImage(named: "search-white")!,UIImage(named: "search-grey")!)
        
        let storyboardFour = UIStoryboard(name: "AccountSettings", bundle: nil)
        let accountView = storyboardFour.instantiateViewController(withIdentifier: "AccountSettings") as! AccountSettings
        addAttributes(accountView, UIImage(named: "account-white")!,UIImage(named: "account-grey")!)
        
        viewControllers = [homeView, inboxView, searchView, accountView]
    }
}

extension TabBarViewController {
    func addAttributes(_ vc: UIViewController,_ unselectedImage: UIImage,_ selectedImage: UIImage) {
        vc.tabBarItem.image = unselectedImage
        vc.tabBarItem.selectedImage = selectedImage
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors().lightGreyBackground], for: .selected)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
    }
}
