//
//  InboxViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/22/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Firebase

class InboxViewController: UIViewController {
    
    var users = [User]()
    @IBOutlet var tableView: UITableView!
    let nibInbox = UINib.init(nibName: "InboxTableViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = tableView.setGradientBackground(Colors().leftGradientColor, Colors().rightGradientColor)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        tableView.register(nibInbox, forCellReuseIdentifier: "InboxTableViewCell")
        fetchUser()
    }
    
    
    @IBAction func viewMessage() {
        
    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User()
                print(dictionary)
                
                user.firstName = (dictionary["firstName"] as! String)
                user.email = (dictionary["email"] as! String)
                user.profileImageUrl = (dictionary["profileImageUrl"] as! String)
                
                self.users.append(user)
                
                // Use dispatch to run on background thread and prevent crashing
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("empty")
            }
        }
    }
}

extension InboxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
//        cell.tintColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
}

extension InboxViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InboxTableViewCell", for: indexPath) as! InboxTableViewCell
        let cards = StaticStrings.MessageCards
        let i = indexPath.row
        
        cell.username.text = users[i].firstName
        cell.message.text = users[i].email
//        cell.timestamp.text = cards[i].timestamp
        
        if let profileImageUrl = users[i].profileImageUrl {
            cell.userImage.loadImageUsingCacheWithUrlString(profileImageUrl)
        }
        
//        if checkMessageCounter(cards[i].messageCounter) {
//            cell.messageCounter.text = cards[i].messageCounter
//        } else {
//            cell.messageCounter.removeFromSuperview()
//        }
        return cell
    }
    
    func segueToInboxThread(){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "") {
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .overCurrentContext
            self.definesPresentationContext = true
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    func checkMessageCounter(_ counter: String) -> Bool{
        let num = Int(counter)
        if num == 0 {
            return false
        }
        return true
    }
    
}
