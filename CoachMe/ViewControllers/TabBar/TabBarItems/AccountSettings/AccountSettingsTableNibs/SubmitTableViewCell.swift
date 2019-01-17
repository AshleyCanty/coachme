//
//  SubmitTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/8/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class SubmitTableViewCell: UITableViewCell {

    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
