//
//  SearchResultsViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/20/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    var animationFlag = true
    let userDefaults = UserDefaults.standard
    let nibSearchButton = UINib.init(nibName: "SearchButtonTableViewCell", bundle: nil)
    let nibTypeInput = UINib.init(nibName: "FilterSortTableViewCell", bundle: nil)
    let nibResultCard = UINib.init(nibName: "resultCardTableViewCell", bundle: nil)
    var vcFilter = UIViewController()
    var vcSort = UIViewController()
    
    var exit = UIButton()
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        UserDefaults.standard.set(1, forKey: "searchScreen")
    }
    
    @objc func dismissSearch() {
        dismiss(animated: true, completion: nil)
        exit.removeFromSuperview()
        userDefaults.set(0, forKey: "searchScreen")
    }
}


extension SearchResultsViewController: UITableViewDataSource {
    
    func setTableView() {
        tableView.register(SearchNibs().nibSearchButton, forCellReuseIdentifier: "SearchButtonTableViewCell")
        tableView.register(SearchNibs().nibTypeInput, forCellReuseIdentifier: "FilterSortTableViewCell")
        tableView.register(SearchNibs().nibResultCard, forCellReuseIdentifier: "resultCardTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getSearchResultsCells(indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (StaticStrings.SearchCard.count + 1)
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return getSearchResultsCells(indexPath)
//    }
}

extension SearchResultsViewController {
    
    
    
    @objc func popupModal() {
        vcSort = storyboard?.instantiateViewController(withIdentifier: "PopoverSortScreenViewController") as! PopoverSortScreenViewController
        vcSort.modalTransitionStyle = .crossDissolve
        vcSort.modalPresentationStyle = .overCurrentContext
        self.definesPresentationContext = true
        self.present(vcSort, animated: true, completion: nil)
        
    }
    
    @objc func popupFilterModal() {
        vcFilter = storyboard?.instantiateViewController(withIdentifier: "PopOverFilterViewController") as! PopOverFilterViewController
        vcFilter.modalTransitionStyle = .crossDissolve
        vcFilter.modalPresentationStyle = .overCurrentContext
        self.definesPresentationContext = true
        self.present(vcFilter, animated: true, completion: nil)
        
    }
    
    func getSearchResultsCells(_ indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSortTableViewCell", for: indexPath) as! FilterSortTableViewCell
            cell.sortButton.addTarget(self, action: #selector(popupModal), for: .touchUpInside)
            cell.filterButton.addTarget(self, action: #selector(popupFilterModal), for: .touchUpInside)
            cell.closeButton.addTarget(self, action: #selector(dismissSearch), for: .touchUpInside)
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
            cell.baseRate.text = StaticStrings.SearchCard[indexPath.row-1].baseRate
            return cell
        }
    }
    
    func getSearchResultCellHeights(_ indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 160
        default:
            return 138
        }
    }
}

extension SearchResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if animationFlag == true {
//            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -10, 0)
//            cell.layer.transform = rotationTransform
//            cell.alpha = 0
//            UIView.animate(withDuration: 0.45, animations: {
//                cell.layer.transform = CATransform3DIdentity
//                cell.alpha = 1.0
//            })
//        }
        if userDefaults.string(forKey: "tab") == "profile" {
            if indexPath.row == 1 {
                animationFlag = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getSearchResultCellHeights(indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return getSearchResultCellHeights(indexPath)
    }
}
