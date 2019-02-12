//
//  TabBarViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/7/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    func setTabbarGradient(){

        let layerGradient = CAGradientLayer()
        layerGradient.colors = [UIColor.black.withAlphaComponent(0.0), UIColor.black.cgColor]
        layerGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        layerGradient.endPoint = CGPoint(x: 0.5, y: 1)
        layerGradient.frame = tabBar.bounds
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = Colors().lightGreen
//        tabBar.barTintColor = Colors().solidDarkBackgroundGreen
        tabBar.barTintColor = UIColor.clear
        tabBar.isTranslucent = true
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.layer.borderWidth = 0
        tabBar.clipsToBounds = true
        

        self.tabBar.layer.addSublayer(layerGradient)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbarGradient()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = nil
        self.navigationController?.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(signOut))
        
        let storyboardOne = UIStoryboard(name: "UserProfile", bundle: nil)
        let homeView = storyboardOne.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        addAttributes(homeView, UIImage(named: "home-white")!,UIImage(named: "home-grey")!)

        let storyboardTwo = UIStoryboard(name: "Inbox", bundle: nil)
        let inboxView = storyboardTwo.instantiateViewController(withIdentifier: "InboxViewController") as! InboxViewController
        addAttributes(inboxView, UIImage(named: "inbox-white")!,UIImage(named: "inbox-grey")!)
        
        let storyboardThree = UIStoryboard(name: "SearchScreen", bundle: nil)
        let searchView = storyboardThree.instantiateViewController(withIdentifier: "SearchScreenViewController") as! SearchScreenViewController
        addAttributes(searchView, UIImage(named: "search-white")!,UIImage(named: "search-grey")!)
        
        let storyboardFour = UIStoryboard(name: "AccountSettings", bundle: nil)
        let accountView = storyboardFour.instantiateViewController(withIdentifier: "AccountSettings") as! AccountSettings
        addAttributes(accountView, UIImage(named: "account-white")!,UIImage(named: "account-grey")!)
        
        viewControllers = [homeView, inboxView, searchView, accountView]
    }
    
    @objc func signOut() {
        navigationController?.popToRootViewController(animated: true)
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
    }
}

extension TabBarViewController {
    func addAttributes(_ vc: UIViewController,_ unselectedImage: UIImage,_ selectedImage: UIImage) {
        vc.tabBarItem.image = unselectedImage
        vc.tabBarItem.selectedImage = selectedImage
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
    }
}
