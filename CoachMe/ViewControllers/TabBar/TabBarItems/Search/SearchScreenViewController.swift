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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(segueToSearch), name: NSNotification.Name(rawValue: "load"), object: nil)
//
//        // 0 = emptyScreen, 1 = searchResults
        userDefaults.set(0, forKey: "searchScreen")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func segueToSearch() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SearchResultsViewController") {
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .overCurrentContext
            self.definesPresentationContext = true
            self.present(vc, animated: true, completion: nil)
        }
    }
}
