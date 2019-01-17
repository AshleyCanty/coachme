//
//  SearchScreenViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class SearchScreenViewController: UIViewController {
    
    var animationFlag = true
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        // 0 = search filter, 1 = search filter
        userDefaults.set(0, forKey: "searchScreenCells")
        // Do any additional setup after loading the view.
    }
    
    func reloadTableData() {
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
