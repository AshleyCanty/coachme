//
//  BioTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/8/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class BioTableViewCell: UITableViewCell, UITextViewDelegate {
    
    var editFlag = false
    var limit = 250
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var charCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        charCount.text = String(limit)
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        charCount.text = String(limit - textView.text.count)

        if textView.text.count == 250 {
            textView.isEditable = false
        }
        print(charCount)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func startEdit(_ sender: Any) {
        if editFlag == false {
            editFlag = true
            editButton.setImage(UIImage(named: "enabled"), for: .normal)
            textView.isEditable = true
            textView.highlightInputBox()
            
        } else {
            editFlag = false
            editButton.setImage(UIImage(named: "disabled"), for: .normal)
            textView.isEditable = false
            textView.removeHighlight()
        }
    }
    
    
    
    
}
