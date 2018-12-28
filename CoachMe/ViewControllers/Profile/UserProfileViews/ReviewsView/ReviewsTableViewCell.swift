//
//  ReviewsTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/13/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var reviewImage: UIButton!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var reviewAuthor: UILabel!
    let reviewsCellHeight = CGFloat(integerLiteral: 183)
    
    @IBAction func seeReviews(_ sender: Any) {
        print("see all reviews")
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        view.addShadows()
        reviewImage.roundedButton([.allCorners])
        reviewText.delegate = self as UITextViewDelegate
    }
    
    func textViewDidChange(_ textView: UITextView){
        let charCount = reviewText.text.count
        if charCount == 300 {
            reviewText.isEditable = false
            
            
        }
        print(charCount)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
