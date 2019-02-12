//
//  SeeMoreTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/26/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class SeeMoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var seeAllReviewsButton: UIButton!
    let seeMoreCellHeight = CGFloat(integerLiteral: 40)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        accessoryView = UIImageView.init(image: UIImage(named: "right-arrow"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
