//
//  SeeReviewsViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/26/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class SeeReviewsViewController: UITableViewController {
    
//    @IBOutlet weak var tableView: UITableView! {
//        didSet {
//            setTableView()
//        }
//    }
    var limit = 0
    var fetchingMore = false
    let nibReviews = UINib(nibName: "ReviewsTableViewCell", bundle: nil)
    let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
    let userDefaults = UserDefaults.standard
    
    var headlines = [
        Headline(title: "About me", text: "first"),
        Headline(title: "Joey Rockout", text: "second"),
        Headline(title: "Photos", text: "third")
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        
        navigationItem.title = NavigationTitles.Reviews
        let bgHeader = UIImage(named: "bgHeader")
        UINavigationBar.appearance().setBackgroundImage(bgHeader, for: .default)
        UINavigationBar.appearance().backgroundColor = Colors().darkGreyBackground
        UINavigationBar.appearance().tintColor = Colors().darkGreyBackground
        setTableView()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > (contentHeight - scrollView.frame.height) {
            if !fetchingMore {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch(){
        fetchingMore = true
        print("beginBatchFetch")
        tableView.reloadSections(IndexSet(integer: 1), with: .none)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
            self.fetchingMore = false
            self.limit += 2
            
            let newItemA = Headline(title: "\(self.limit-2)", text: "\(self.headlines.count+1)")
            let newItemB = Headline(title: "\(self.limit-1)", text: "\(self.headlines.count+2)")
            self.headlines.append(newItemA)
            self.headlines.append(newItemB)
            self.tableView.reloadData()
        })
    }
    
    func setTableView() {
        self.tableView.dataSource = self as UITableViewDataSource
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.delaysContentTouches = false
        self.tableView.register(loadingNib, forCellReuseIdentifier: "LoadingCell")
        self.tableView.register(nibReviews, forCellReuseIdentifier: "ReviewsTableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return headlines.count
        } else if section == 1 && fetchingMore {
            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return ReviewsTableViewCell().reviewsCellHeight
        } else {
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return ReviewsTableViewCell().reviewsCellHeight
        } else {
             return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
            cell.reviewAuthor.text = headlines[indexPath.row].title
            cell.reviewText.text = headlines[indexPath.row].text
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
            cell.spinner.startAnimating()
            return cell
        }
    }
}
