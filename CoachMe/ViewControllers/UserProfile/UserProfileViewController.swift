//
//  UserProfileViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/9/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import AVKit
import WebKit
import Cosmos
import TinyConstraints
import Firebase

class UserProfileViewController: UIViewController  {
    
    var index = 0
    var limit = 3
    var fetchingMore = false
    lazy var counter = 0
//    var videoCode = "PJvOR4ue3tU"
    var videoCode = "yvw8WtSKmZw"
    var headlines = [
        Headline(title: "About me", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, alitrud exercitation ullamco laboris nisi ut exercitation ullamco laborivghvvvvs nisi ut txercitation ullamco laboris nisi ut exercitation"),
        Headline(title: "Joey Rockout", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, alitrud exercitation ullamco laboris nisi ut exercitation ullamco laborivghvvvvs nisi ut txercitation ullamco laboris nisi ut exercitation"),
        Headline(title: "Photos", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, alitrud exercitation ullamco laboris nisi ut exercitation ullamco laborivghvvvvs nisi ut txercitation ullamco laboris nisi ut exercitation")
    ]
    var animationFlag = true
    let user = User()
//    var users = [User]()
    let reviewView = AddReviewView()
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            setTableView()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
//        self.extendedLayoutIncludesOpaqueBars = false
//        tableView.contentInsetAdjustmentBehavior = .never
        
        tableView.backgroundView = setGradientBackground(Colors().leftGradientColor, Colors().rightGradientColor)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        userDefaults.set("profile", forKey: "tab")
        reviewView.textbox.delegate = self as UITextViewDelegate
        reviewView.submitBtn.addTarget(self, action: #selector(submitReviewsClicked), for: .touchUpInside)
        
        
//        fetchUser()
//        fetchUserFromDatabaseWithUid()
        getProfileImageUrl()
        checkIfUserIsLoggedIn()
//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
//        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
    }
    
    
    func setGradientBackground(_ colorOne: UIColor, _ colorTwo: UIColor) -> UIView {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = tableView.bounds
        gradientLayer.colors = [colorTwo.cgColor, colorOne.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        return backgroundView
    }
    
    func handleLogout() {
        do {
            try Auth.auth().signOut()            
        } catch let logoutError {
            print(logoutError)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid != nil {
            print("YES----------------")
            print(Auth.auth().currentUser?.email, "----------------")
            print(Auth.auth().currentUser?.uid, "---------FIRST-------")
            fetchUserAndSetupNavBarTitle()
        } else {
            print("NO")
            handleLogout()
        }
    }
    func fetchUserAndSetupNavBarTitle() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Could not retrieve user.")
            return
        }
        
        Database.database().reference().child("users").child(uid).observe(.value) { (snapshot) in
            print(uid, "---------SECOND-------")
            print(snapshot)
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User()
                user.firstName = (dictionary["firstName"] as? String)
                user.lastName = (dictionary["lastName"] as? String)
                user.email = (dictionary["email"] as? String)
                user.profileImageUrl = (dictionary["profileImageUrl"] as? String)
                
                self.setupNavBarWithUser(user)
            }
        }
    }
    
    func setupNavBarWithUser(_ user: User){
        let titleView = UIView()
        navigationController?.navigationBar.topItem?.title = user.firstName
    }
    
    @objc func showPhotos() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PhotosCollectionViewController") as! PhotosCollectionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pushToSeeAllReviewsView(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SeeAllReviewsViewController") as! SeeAllReviewsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addReviewClicked() {
        UIApplication.shared.keyWindow?.addSubview(reviewView.mainView)
        UIApplication.shared.keyWindow?.bringSubviewToFront(reviewView.mainView)
        reviewView.mainView.center.x = -reviewView.mainView.frame.width/2
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            self.reviewView.textbox.text = StaticStrings.LeaveReview
            self.reviewView.mainView.center.x = self.view.center.x
        })
    }
    
    @objc func submitReviewsClicked(){
        headlines.insert((Headline(title: "JackTheRipper", text: "I have jokes.")), at: 0)
        removeAddReviews()
        reloadTableData()
    }
    
    @objc func removeAddReviews(){
        reviewView.mainView.removeFromSuperview()
    }
    
    @objc func reloadTableData() {
        if userDefaults.string(forKey: "tab") == "reviews" {
            index = 0
        }
       
        self.tableView.dataSource = nil
        self.tableView.dataSource = self as UITableViewDataSource
        self.tableView.reloadData()
    }
}


extension UserProfileViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let total: Int = (textView.text.count)
        let remainder =  400 - total
        
        if total < 400 {
            reviewView.charCount.text = String(remainder)
            textView.isEditable = true
            reviewView.mainView.setNeedsDisplay()
        } else {
            textView.isEditable = false
        }
    }
}

