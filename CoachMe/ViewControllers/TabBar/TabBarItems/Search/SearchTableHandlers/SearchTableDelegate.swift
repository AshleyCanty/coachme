//
//  SearchTableDelegate.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit

extension SearchScreenViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if animationFlag == true {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -10, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0
            UIView.animate(withDuration: 0.45, animations: {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1.0
            })
        }
        if userDefaults.string(forKey: "tab") == "profile" {
            if indexPath.row == 1 {
                animationFlag = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let searchScreenCells = userDefaults.integer(forKey: "searchScreenCells")
        switch searchScreenCells {
        case 0:
            return getMainSearchCellHeights(indexPath)
        default:
            return getSearchResultCellHeights(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let searchScreenCells = userDefaults.integer(forKey: "searchScreenCells")
        switch searchScreenCells {
        case 0:
            return getMainSearchCellHeights(indexPath)
        default:
            return getSearchResultCellHeights(indexPath)
        }
    }
}
