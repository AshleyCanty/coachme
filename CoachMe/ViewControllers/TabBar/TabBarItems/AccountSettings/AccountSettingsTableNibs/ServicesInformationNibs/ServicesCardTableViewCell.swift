//
//  ServicesCardTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/12/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class ServicesCardTableViewCell: UITableViewCell {
    
    var editFlag = false
    
    @IBOutlet weak var title: UITextField!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var editButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        details.isEditable = false
    }
    @IBAction func startEdit(_ sender: UIButton) {
            if editFlag == false {
                editFlag = true
                editButton.setImage(UIImage(named: "enabled"), for: .normal)
                title.isUserInteractionEnabled = true
                rate.isUserInteractionEnabled = true
            } else {
                editFlag = false
                editButton.setImage(UIImage(named: "disabled"), for: .normal)
                title.isUserInteractionEnabled = false
                rate.isUserInteractionEnabled = false
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
