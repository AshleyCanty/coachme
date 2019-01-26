//
//  PopoverSortScreenViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/19/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class PopoverSortScreenViewController: UIViewController {
    
    @IBOutlet weak var avgRating: UIButton!
    @IBOutlet weak var priceHigh: UIButton!
    @IBOutlet weak var priceLow: UIButton!
    @IBOutlet weak var distanceNearby: UIButton!
    @IBOutlet weak var distanceFar: UIButton!
    
    var buttons = [UIButton]()
    var vc = UIView()
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTag()
        checkStatus()
        print("SortingModal")
        print(userDefaults.integer(forKey: "sortButton"))
    }

    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func sortButtonPressed(_ sender: UIButton) {
        let tag = sender.tag
        switch sender.tag {
        case 0:
            userDefaults.set(tag, forKey: "sortButton")
        case 1:
            userDefaults.set(tag, forKey: "sortButton")
        case 2:
            userDefaults.set(tag, forKey: "sortButton")
        case 3:
            userDefaults.set(tag, forKey: "sortButton")
        case 4:
            userDefaults.set(tag, forKey: "sortButton")
        default:
            print("")
        }
    }
    
    func checkStatus(){
        for button in buttons {
            if button.tag == userDefaults.integer(forKey: "sortButton") {
                button.backgroundColor = Colors().lightGreen
            }
        }
    }
    
    func setTag(){
        avgRating.tag = 0
        priceHigh.tag = 1
        priceLow.tag = 2
        distanceNearby.tag = 3
        distanceFar.tag = 4
        buttons = [avgRating,priceHigh,priceLow,distanceNearby,distanceFar]
    }
}
