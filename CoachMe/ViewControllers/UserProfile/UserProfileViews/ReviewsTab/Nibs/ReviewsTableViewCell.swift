//
//  ReviewsTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/13/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import Cosmos

class ReviewsTableViewCell: UITableViewCell, UITextViewDelegate {

    
    @IBOutlet weak var cosmosStars: CosmosView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var reviewImage: UIButton!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var reviewAuthor: UILabel!
    let reviewsCellHeight = CGFloat(integerLiteral: 183)
    var rating = 0.0
    
    func loadReviewInfo(){
        
    }
    
    @IBAction func setInfo() {

        let obj = ReviewsData()
        reviewAuthor.text = obj.dataArray["reviewAuthor"] as? String
        reviewText.text = obj.dataArray["reviewText"] as? String
        
        let img = UIImage(imageLiteralResourceName: "usher")
        reviewImage.setImage(img, for: .normal)
        cosmosStars.rating = obj.dataArray["rating"] as! Double
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        view.addShadows()
        reviewImage.roundedButton([.allCorners])
        reviewText.delegate = self as UITextViewDelegate
        cosmosStars.rating = rating
        cosmosStars.isUserInteractionEnabled = false
        setInfo()
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
