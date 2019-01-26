//
//  FilterSortTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/14/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class FilterSortTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var totalResults: UILabel!
    @IBOutlet weak var mentorType: UILabel!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print("Update search")
    }
    @IBAction func editingDidChange(_ sender: UITextField) {
        print(searchInput.text)
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
