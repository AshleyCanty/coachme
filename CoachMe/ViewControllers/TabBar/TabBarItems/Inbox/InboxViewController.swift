//
//  InboxViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/22/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    let nibInbox = UINib.init(nibName: "InboxTableViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(nibInbox, forCellReuseIdentifier: "InboxTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func viewMessage() {
        
    }
}

extension InboxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
}

extension InboxViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticStrings.MessageCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InboxTableViewCell", for: indexPath) as! InboxTableViewCell
        let cards = StaticStrings.MessageCards
        let i = indexPath.row
        
        cell.userImage.image = UIImage(named: cards[i].userImage)
        cell.username.text = cards[i].username
        cell.message.text = cards[i].message
        cell.timestamp.text = cards[i].timestamp
        
        if checkMessageCounter(cards[i].messageCounter) {
            cell.messageCounter.text = cards[i].messageCounter
        } else {
            cell.messageCounter.removeFromSuperview()
        }
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
