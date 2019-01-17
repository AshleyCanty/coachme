//
//  AccountSettingsTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/5/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class AccountSettingsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var label: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
