//
//  SearchTableCells.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit

extension SearchScreenViewController {

    
    func getSearchScreenCells (_ indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TypePriceTableViewCell", for: indexPath) as! TypePriceTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationInputTableViewCell", for: indexPath) as! LocationInputTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchButtonTableViewCell", for: indexPath) as! SearchButtonTableViewCell
            cell.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationInputTableViewCell", for: indexPath) as! LocationInputTableViewCell
            return cell
        }
    }
    
    func getSearchResultsCells(_ indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSortTableViewCell", for: indexPath) as! FilterSortTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "resultCardTableViewCell", for: indexPath) as! resultCardTableViewCell
            let image = UIImage(named: StaticStrings.SearchCard[indexPath.row-1].image)
            cell.userImage.image = image
            cell.firstname.text = StaticStrings.SearchCard[indexPath.row-1].firstname
            cell.lastname.text = StaticStrings.SearchCard[indexPath.row-1].lastname
            cell.averageRating.text = StaticStrings.SearchCard[indexPath.row-1].averageRating
            cell.location.text = StaticStrings.SearchCard[indexPath.row-1].location
            cell.lastActive.text = StaticStrings.SearchCard[indexPath.row-1].lastActive
            return cell
        }
    }
    
    @objc func searchButtonPressed() {
        userDefaults.set(1, forKey: "searchScreenCells")
        print("sknsjkn")
        reloadTableData()
    }
    
    func searchResultsUpdated() {
        
    }
    
    func getMainSearchCellHeights(_ indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 210
        case 1:
            return 180
        default:
            return 80
        }
    }
    
    func getSearchResultCellHeights(_ indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 187
        default:
            return 138
        }
    }
}
