//
//  AccountSettingsTableDelegate.swift
//  CoachMe
//
//  Created by ashley canty on 1/9/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit

extension AccountSettings: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if animationFlag {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -10, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0
            UIView.animate(withDuration: 0.45, animations: {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1.0
            })
        }
        
            if userDefaults.integer(forKey: "currentData") == 2 {
                if indexPath.row == ((StaticStrings.ServiceCard.count + 2)-1) {
                    print("YERRRP")
                    animationFlag = false
                }
            }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentData = userDefaults.integer(forKey: "currentData")
        switch currentData {
        case 0:
            print("settings menu")
            return getAccountSettingsCells(indexPath)
        case 1:
            return getBasicInfoCells(indexPath)
            print("basic data")
        case 2:
            print("services data")
            return getServiceInfoCells(indexPath)
        default:
            return getAccountSettingsCells(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentData = userDefaults.integer(forKey: "currentData")
        switch currentData {
        case 0:
            print("settings menu")
            return 3
        case 1:
            return 4
            print("basic data")
        case 2:
            print("services data 4 cells")
            return StaticStrings.ServiceCard.count + 2
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentData = userDefaults.integer(forKey: "currentData")
        switch currentData {
        case 0:
            return getAccountSettingsCellHeight(indexPath)
        case 1:
            return getBasicInfoCellHeight(indexPath)
        case 2:
            return getServicesInfoCellHeight(indexPath)
        default:
            print()
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentData = userDefaults.integer(forKey: "currentData")
        
        switch currentData {
        case 0:
            return getAccountSettingsCellHeight(indexPath)
        case 1:
            return getBasicInfoCellHeight(indexPath)
        case 2:
            return getServicesInfoCellHeight(indexPath)
        default:
            return 100
        }
    }
    
    func getAccountSettingsCellHeight(_ indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func getBasicInfoCellHeight(_ indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0,1:
            return 70
        case 2:
            return 248
        default:
            return 100
        }
    }
    
    func getServicesInfoCellHeight(_ indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 70
        case ((StaticStrings.ServiceCard.count + 2)-1):
            return 100
        default:
            return 145
        }
    }
}
