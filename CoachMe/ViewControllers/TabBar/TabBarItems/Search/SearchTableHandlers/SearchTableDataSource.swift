//
//  SearchTableDataSource.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit


class SearchNibs {
    let nibTypePrice = UINib.init(nibName: "TypePriceTableViewCell", bundle: nil)
    let nibLocation = UINib.init(nibName: "LocationInputTableViewCell", bundle: nil)
    let nibSearchButton = UINib.init(nibName: "SearchButtonTableViewCell", bundle: nil)
    let nibTypeInput = UINib.init(nibName: "FilterSortTableViewCell", bundle: nil)
    let nibResultCard = UINib.init(nibName: "resultCardTableViewCell", bundle: nil)
}

extension SearchScreenViewController: UITableViewDataSource {
    
    func setTableView() {
        tableView.register(SearchNibs().nibTypePrice, forCellReuseIdentifier: "TypePriceTableViewCell")
        tableView.register(SearchNibs().nibLocation, forCellReuseIdentifier: "LocationInputTableViewCell")
        tableView.register(SearchNibs().nibSearchButton, forCellReuseIdentifier: "SearchButtonTableViewCell")
        tableView.register(SearchNibs().nibTypeInput, forCellReuseIdentifier: "FilterSortTableViewCell")
        tableView.register(SearchNibs().nibResultCard, forCellReuseIdentifier: "resultCardTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let searchScreenCells = userDefaults.integer(forKey: "searchScreenCells")
        switch searchScreenCells {
        case 0:
            return 3
        default:
            return (StaticStrings.SearchCard.count + 1)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchScreenCells = userDefaults.integer(forKey: "searchScreenCells")
        switch searchScreenCells {
        case 0:
            return getSearchScreenCells(indexPath)
        case 1:
            return getSearchResultsCells(indexPath)
        default:
            return getSearchScreenCells(indexPath)
        }
    }
}
