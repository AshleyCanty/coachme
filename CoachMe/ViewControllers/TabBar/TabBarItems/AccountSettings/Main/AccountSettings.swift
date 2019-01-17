//
//  AccountSettings.swift
//  CoachMe
//
//  Created by ashley canty on 1/5/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class AccountSettings: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var animationFlag = true
    var cardLimit = StaticStrings.ServiceCard.count
    let userDefaults = UserDefaults.standard
    let board = UIStoryboard(name: "AccountSettings", bundle: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 0 = main, 1 = basicInfo, 2 = services
        userDefaults.set(0, forKey: "currentData")
        
        // -1 = not set, 0 = deleteCard, 1 = addCard
        userDefaults.set(-1, forKey: "counter")
        setTitle()
        setTableView()
    }
    
    func setTitle() {
        let currentData = userDefaults.integer(forKey: "currentData")
        var title = ""
        
        switch currentData {
        case 0:
            title = "Settings"
        case 1:
            title = "Basic Info"
        case 2:
            title = "Services"
        default:
            print()
        }

    }
    
    // Account Settings = 0
    @objc func loadAccountSettingsInfo() {
        animationFlag = true
        userDefaults.set(0, forKey: "currentData")
        tableView.dataSource = nil
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.tableView.dataSource = self as UITableViewDataSource
            self.tableView.reloadData()
            self.setTitle()
        })
    }
    
    // Basic info = 1
    @objc func loadBasicInfo() {
        animationFlag = true
        userDefaults.set(1, forKey: "currentData")
        tableView.dataSource = nil
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.tableView.dataSource = self as UITableViewDataSource
            self.tableView.reloadData()
            self.setTitle()
        })
    }
    
    // Service = 2
    @objc func loadServiceInfo() {
        userDefaults.set(2, forKey: "currentData")
        tableView.dataSource = nil
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.tableView.dataSource = self as UITableViewDataSource
            self.tableView.reloadData()
            self.setTitle()
        })
    }

}

