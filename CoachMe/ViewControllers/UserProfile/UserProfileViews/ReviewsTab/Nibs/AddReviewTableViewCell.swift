//
//  AddReviewTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/18/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class AddReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var seeAllReviewsButton: UIButton!
    @IBOutlet weak var addReviewButton: UIButton!
    let buttonCellHeight = CGFloat(integerLiteral: 30)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
