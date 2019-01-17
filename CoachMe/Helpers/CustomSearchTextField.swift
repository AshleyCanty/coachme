//
//  CustomSearchTextField.swift
//  CoachMe
//
//  Created by ashley canty on 1/13/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomSearchTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        addPaddingAndBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        addPaddingAndBorder()
    }
    
    
    
    func addPaddingAndBorder() {
        let newRightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width:8.0, height: 2.0))
        self.rightView = newRightView
        self.rightViewMode = .always
    }
    
}
