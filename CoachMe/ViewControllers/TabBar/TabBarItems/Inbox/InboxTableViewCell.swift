//
//  InboxTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/22/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class InboxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var messageCounter: UILabel!
    @IBOutlet weak var clearButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = 35
        userImage.clipsToBounds = true
        userImage.layer.masksToBounds = true
        
        messageCounter.layer.cornerRadius = (messageCounter.frame.width/2)
        messageCounter.clipsToBounds = true
        messageCounter.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
