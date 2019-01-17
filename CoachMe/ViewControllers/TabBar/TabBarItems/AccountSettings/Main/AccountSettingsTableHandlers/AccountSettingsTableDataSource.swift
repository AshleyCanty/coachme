//
//  AccountSettingsTableDataSource.swift
//  CoachMe
//
//  Created by ashley canty on 1/9/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit 

class AccountSettingsNibs {
    let board = UIStoryboard(name: "AccountSettings", bundle: nil)
    let nibSettings = UINib.init(nibName: "AccountSettingsTableViewCell", bundle: nil)
    let nibBasic = UINib.init(nibName: "BasicInfoTableViewCell", bundle: nil)
    let nibBio = UINib.init(nibName: "BioTableViewCell", bundle: nil)
    let nibSubmit = UINib.init(nibName: "SubmitTableViewCell", bundle: nil)
    let serviceCard = UINib.init(nibName: "ServicesCardTableViewCell", bundle: nil)
    let serviceCounter = UINib.init(nibName: "ServicesCounterTableViewCell", bundle: nil)
    let emptyList = UINib.init(nibName: "EmptyListTableViewCell", bundle: nil)
    
    
}

extension AccountSettings: UITableViewDataSource {
    func setTableView() {
        //        self.tableView.contentInsetAdjustmentBehavior = .never
        tableView.dataSource = self as UITableViewDataSource
        tableView.delaysContentTouches = false
        tableView.register(AccountSettingsNibs().nibSettings, forCellReuseIdentifier: "AccountSettingsTableViewCell")
        tableView.register(AccountSettingsNibs().nibBasic, forCellReuseIdentifier: "BasicInfoTableViewCell")
        tableView.register(AccountSettingsNibs().nibBio, forCellReuseIdentifier: "BioTableViewCell")
        tableView.register(AccountSettingsNibs().nibSubmit, forCellReuseIdentifier: "SubmitTableViewCell")
        tableView.register(AccountSettingsNibs().serviceCard, forCellReuseIdentifier: "ServicesCardTableViewCell")
        tableView.register(AccountSettingsNibs().serviceCounter, forCellReuseIdentifier: "ServicesCounterTableViewCell")
        tableView.register(AccountSettingsNibs().emptyList, forCellReuseIdentifier: "EmptyListTableViewCell")
    }
}
