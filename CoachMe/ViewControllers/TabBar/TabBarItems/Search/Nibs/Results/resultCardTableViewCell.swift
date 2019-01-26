//
//  resultCardTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Cosmos

class resultCardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var averageRating: UILabel!
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var baseRate: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var lastActive: UILabel!
    @IBOutlet weak var viewprofileButton: UIButton!
    
    
    
    @IBAction func viewProfileButtonPressed(_ sender: UIButton) {
        print("view button pressed")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.roundImageCorners([.bottomLeft, .topLeft])
        // Initialization code
    }
    
    func highlightInputBox() {
        layer.masksToBounds = false
        layer.shadowColor = Colors().lightGreen.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
