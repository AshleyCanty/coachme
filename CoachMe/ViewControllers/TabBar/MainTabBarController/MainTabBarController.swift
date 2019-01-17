////
////  MainTabBarController.swift
////  CoachMe
////
////  Created by ashley canty on 1/7/19.
////  Copyright © 2019 ashley canty. All rights reserved.
////
//
//import UIKit
//
//class MainTabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tabBar.barTintColor = Colors().lightGreen
//        setupTabBar()
//        // Do any additional setup after loading the view.
//    }
//    
//
//    
//    func setupTabBar() {
//        
//        let userProfileController = createNavController(UserProfileViewController(), "Home", UIImage(imageLiteralResourceName: "home-white"), UIImage(imageLiteralResourceName: "home-grey"))
//        
//        
//        let savedController = createNavController(UserProfileViewController(), "Saved", UIImage(imageLiteralResourceName: "saved-white"), UIImage(imageLiteralResourceName: "saved-grey"))
//        
//        let inboxController = createNavController(UserProfileViewController(), "Inbox", UIImage(imageLiteralResourceName: "inbox-white"), UIImage(imageLiteralResourceName: "inbox-grey"))
//        
//        let accountController = createNavController(AccountSettings(), "Account", UIImage(imageLiteralResourceName: "account-white"), UIImage(imageLiteralResourceName: "account-grey"))
//        
//        viewControllers = [userProfileController, inboxController, savedController, accountController]
//    }
//    
//    
//}
//
//extension UITabBarController {
//    func createNavController(_ vc: UIViewController,_ title: String, _ unselectedImage: UIImage, _ selectedImage: UIImage) -> UINavigationController {
//        let viewController = vc
//        let navController = UINavigationController(rootViewController: viewController)
//        navController.tabBarItem.image = unselectedImage
//        navController.tabBarItem.selectedImage = selectedImage
//        navController.tabBarItem.title = title
//        navController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//        navController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors().darkGreyBackground], for: .selected)        
//        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
//        return navController
//    }
//}
