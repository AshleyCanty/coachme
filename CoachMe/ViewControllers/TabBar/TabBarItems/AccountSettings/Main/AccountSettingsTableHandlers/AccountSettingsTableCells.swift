//
//  AccountSettingsTableCells.swift
//  CoachMe
//
//  Created by ashley canty on 1/9/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit

extension AccountSettings {
    

    func getAccountSettingsCells(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountSettingsTableViewCell", for: indexPath) as! AccountSettingsTableViewCell
        switch indexPath.row {
        case 0:
            cell.title.text = "Basic Information"
            cell.label.text = "Manage name, location, and bio..."
            cell.button.addTarget(self, action: #selector(loadBasicInfo), for: .touchUpInside)
        case 1:
            cell.title.text = "Services Provided"
            cell.label.text = "Manage services and costs"
            cell.button.addTarget(self, action: #selector(loadServiceInfo), for: .touchUpInside)
        default:
            cell.title.text = "Sign out"
            cell.label.text = ""
            cell.button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        }
        return cell
    }
    
    @objc func signOut() {
        navigationController?.popToRootViewController(animated: true)
        for (key, value) in userDefaults.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
    }
    
    func getBasicInfoCells(_ indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfoTableViewCell", for: indexPath) as! BasicInfoTableViewCell
            cell.title.text = "Name"
            cell.input.text = "Ashley Canty"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfoTableViewCell", for: indexPath) as! BasicInfoTableViewCell
            cell.title.text = "Location"
            cell.input.text = "Pleasantville, NJ"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BioTableViewCell", for: indexPath) as! BioTableViewCell
            cell.title.text = "Bio"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitTableViewCell", for: indexPath) as! SubmitTableViewCell
            cell.saveButton.addTarget(self, action: #selector(loadAccountSettingsInfo), for: .touchUpInside)
            cell.cancelButton.addTarget(self, action: #selector(loadAccountSettingsInfo), for: .touchUpInside)
            return cell
        }
    }

    func getServiceInfoCells(_ indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesCounterTableViewCell", for: indexPath) as! ServicesCounterTableViewCell
            cardLimit = StaticStrings.ServiceCard.count
            cell.total.text = String(StaticStrings.ServiceCard.count)
            cell.minusButton.addTarget(self, action: #selector(cardCounterPressed), for: .touchUpInside)
            cell.plusButton.addTarget(self, action: #selector(cardCounterPressed), for: .touchUpInside)
            
            return cell
        case 1:
            if StaticStrings.ServiceCard.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyListTableViewCell", for: indexPath) as! EmptyListTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesCardTableViewCell", for: indexPath) as! ServicesCardTableViewCell
                
                cell.title.text = StaticStrings.ServiceCard[indexPath.row - 1].title
                cell.rate.text = StaticStrings.ServiceCard[indexPath.row - 1].rate
                return cell
            }
        case ((StaticStrings.ServiceCard.count + 2) - 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitTableViewCell", for: indexPath) as! SubmitTableViewCell
            cell.saveButton.addTarget(self, action: #selector(loadAccountSettingsInfo), for: .touchUpInside)
            cell.cancelButton.addTarget(self, action: #selector(loadAccountSettingsInfo), for: .touchUpInside)
            animationFlag = false
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesCardTableViewCell", for: indexPath) as! ServicesCardTableViewCell
            
            cell.title.text = StaticStrings.ServiceCard[indexPath.row - 1].title
            cell.rate.text = StaticStrings.ServiceCard[indexPath.row - 1].rate
            return cell
        }
    }
    
    @objc func cardCounterPressed() {
        let counter = userDefaults.integer(forKey: "counter")
        
        switch counter {
        case -1:
            print("Nothing")
        case 0:
            print("delete")
            
            // if there already exists saved cards, confirm if user wants to delete them
            if StaticStrings.ServiceCard.count != 0 {
                let alert = UIAlertController(title: "Are you sure?", message: "You are about delete a service card.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .destructive, handler: { action in
                    if self.cardLimit > 0 {
                        StaticStrings.ServiceCard.removeLast()
                    }
                    self.loadServiceInfo()
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        case 1:
            print("add")
            
            if cardLimit < 5 {
                StaticStrings.ServiceCard.append(ServiceCardInfo(title: "Music", rate: "500"))
            }
            if cardLimit == 5 {
                let alert = UIAlertController(title: "Limit reached", message: "You are only allowed to list 5 services.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            loadServiceInfo()
        default:
            print("M")
        }
        print(cardLimit)
    }
    
    @objc func editServiceCard() {
        print("pressed")
    }
}
