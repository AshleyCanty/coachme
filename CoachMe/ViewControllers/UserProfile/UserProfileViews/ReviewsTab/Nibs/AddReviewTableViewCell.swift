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
    let buttonCellHeight = CGFloat(integerLiteral: 50)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeAddReviewButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customizeAddReviewButton(){
        addReviewButton.layer.borderColor = Colors().lightGreen.cgColor
        addReviewButton.layer.borderWidth = 1
        addReviewButton.backgroundColor = UIColor.clear
        addReviewButton.layer.cornerRadius = 15
    }
}
