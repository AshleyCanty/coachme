//
//  ReviewsTableViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/17/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class ReviewsTableViewController: UIView, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("here")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("goging")
        let headline = StaticStrings.headlines[0]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath)
        
        return cell
    }
    



}
