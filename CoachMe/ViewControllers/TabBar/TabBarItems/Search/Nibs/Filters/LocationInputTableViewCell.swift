//
//  LocationInputTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class LocationInputTableViewCell: UITableViewCell {
    
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var distance: UISlider!
    @IBOutlet weak var currentDistance: UILabel!
    
    
    @IBAction func getValue(_ sender: UISlider) {
        currentDistance.text = String(Int(sender.value))
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
