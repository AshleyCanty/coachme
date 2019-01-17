//
//  AboutMeViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/12/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class AboutMeViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var view: UIView!
    let aboutCellHeight = CGFloat(integerLiteral: 205)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(view.bounds.height)
        textView.isEditable = false
        view.addShadows()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
