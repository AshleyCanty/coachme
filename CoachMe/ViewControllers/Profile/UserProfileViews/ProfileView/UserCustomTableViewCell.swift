//
//  UserCustomTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/12/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class UserCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
