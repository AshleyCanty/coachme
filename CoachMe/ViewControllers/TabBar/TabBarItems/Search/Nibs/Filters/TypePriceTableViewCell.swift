//
//  TypePriceTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class TypePriceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var typeInput: UITextField!
    @IBOutlet weak var pricebox: UILabel!
    

    @IBAction func getValue(_ sender: UISlider) {
        pricebox.text = String(Int(sender.value))
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
