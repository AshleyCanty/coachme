//
//  ServicesCounterTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/12/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class ServicesCounterTableViewCell: UITableViewCell {
    
    let userDefaults = UserDefaults.standard
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var total: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        total.layer.cornerRadius = (total.frame.width/2)
        total.layer.masksToBounds = true
        total.clipsToBounds = true
        // Initialization code
    }
    
    
    @IBAction func deleteCard(_ sender: Any) {
        userDefaults.setValue(0, forKey: "counter")
    }
    
    @IBAction func addCard(_ sender: Any) {
        userDefaults.setValue(1, forKey: "counter")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
