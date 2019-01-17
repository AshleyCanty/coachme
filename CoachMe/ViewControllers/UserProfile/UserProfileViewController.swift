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

class UserProfileViewController: UIViewController  {
    
    var index = 0
    var limit = 3
    var fetchingMore = false
    lazy var counter = 0
//    var videoCode = "PJvOR4ue3tU"
    var videoCode = "yvw8WtSKmZw"
    var headlines = [
        Headline(title: "About me", text: "first"),
        Headline(title: "Joey Rockout", text: "second"),
        Headline(title: "Photos", text: "third")
    ]
    var animationFlag = true
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NavigationTitles.Profile
//        navigationItem.hidesBackButton = true
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        userDefaults.set("profile", forKey: "tab")
        reviewView.textbox.delegate = self as UITextViewDelegate
        reviewView.submitBtn.addTarget(self, action: #selector(submitReviewsClicked), for: .touchUpInside)
        
//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
//        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
    }
    
    @objc func showPhotos(){
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

