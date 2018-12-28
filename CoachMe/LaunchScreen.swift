//
//  SplashScreen.swift
//  CoachMe
//
//  Created by ashley canty on 12/2/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {
    
    let darkGreen: UIColor = UIColor(red: 59.0/255.0, green:109.0/255.0, blue: 101.0/255.0, alpha: 1.0)
    let orange: UIColor = UIColor(red: 221.0/255.0, green:128.0/255.0, blue: 50.0/255.0, alpha: 1.0)

    @IBOutlet weak var mainTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        changeTextColor()
    }
    
    
    func changeTextColor(){
        let string = "coachMe"
        let range1 = (string as NSString).range(of: "Me")
        let range2 = (string as NSString).range(of: "coach")
        
        let attr = NSMutableAttributedString(string: string)
        attr.addAttribute(NSAttributedString.Key.foregroundColor,value: orange , range: range1)
        attr.addAttribute(NSAttributedString.Key.foregroundColor, value: darkGreen, range: range2)
        mainTitle.attributedText = attr
    }

}
