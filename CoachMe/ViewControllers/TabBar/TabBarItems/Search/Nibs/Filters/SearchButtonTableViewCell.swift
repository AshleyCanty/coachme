//
//  SearchButtonTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class SearchButtonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var searchButton: UIButton!
    

    
    @IBAction func buttonPressed(_ sender: Any) {
        print("pressed searchbutton")
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
