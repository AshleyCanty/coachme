//
//  ServicesTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/26/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {

    let servicesCellHeight = CGFloat(integerLiteral: 150)
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addShadows()
        containerView.backgroundColor = UIColor.clear
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 6
        textView.addTailAndCutLines(.byTruncatingTail, 4)
        view.insertSubview(view.setGradientBackground(Colors().leftGradientColor, Colors().leftGradientColor.withAlphaComponent(0.70)), at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
