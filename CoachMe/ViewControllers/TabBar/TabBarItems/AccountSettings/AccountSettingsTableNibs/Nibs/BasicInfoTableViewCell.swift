//
//  BasicInfoTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 1/8/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var editFlag = false
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    
    // limit ot 40 chars fo name

    override func awakeFromNib() {
        super.awakeFromNib()
        configureTextFields()
//        input.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print(input.text)
        if input.text?.count == 30 {
            input.isUserInteractionEnabled = false
        } else {
            input.isUserInteractionEnabled = true
        }
    }


    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        input.removeHighlight()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }
    
    func configureTextFields() {
        input.delegate = self
    }
    
    @IBAction func startEdit(_ sender: Any) {
        if editFlag == false {
            editFlag = true
            editButton.setImage(UIImage(named: "enabled"), for: .normal)
            input.highlightInputBox()
            input.isUserInteractionEnabled = true
//            input.backgroundColor = UIColor.white
//            input.textColor = UIColor.darkGray
        } else {
            editFlag = false
           editButton.setImage(UIImage(named: "disabled"), for: .normal)
            input.removeHighlight()
            input.isUserInteractionEnabled = false
//            input.backgroundColor = UIColor.clear
//            input.textColor = UIColor.lightGray
            
        }
    }
    
    
    
}
