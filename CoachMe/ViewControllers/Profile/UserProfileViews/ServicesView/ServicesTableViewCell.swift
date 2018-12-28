//
//  ServicesTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/26/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {

    let servicesCellHeight = CGFloat(integerLiteral: 200)
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.addShadows()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
