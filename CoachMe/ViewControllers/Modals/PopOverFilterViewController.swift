//
//  PopOverFilterViewController.swift
//  CoachMe
//
//  Created by ashley canty on 1/20/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class PopOverFilterViewController: UIViewController {
    
    @IBOutlet weak var typeInput: UITextField!
    @IBOutlet weak var pricebox: UILabel!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var distance: UISlider!
    @IBOutlet weak var currentDistance: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        // Do any additional setup after loading the view.
    }

    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        if UserDefaults.standard.integer(forKey: "searchScreen") == 0 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
    }
}
