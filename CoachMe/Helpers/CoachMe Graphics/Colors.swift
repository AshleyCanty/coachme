//
//  Colors.swift
//  CoachMe
//
//  Created by ashley canty on 12/3/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//
// TODO -- if mentor, use green color scheme by defualt, if mentee use orange
import Foundation
import UIKit


extension UIView {
    func setGradientBackground(_ colorOne: UIColor, _ colorTwo: UIColor) -> UIView {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorTwo.cgColor, colorOne.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        let backgroundView = UIView(frame: bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        return backgroundView
    }
}

class Colors: UIColor {
    
    let opaqueWhite: UIColor = UIColor(red:255.0, green:255.0, blue: 255.0, alpha: 0.20)
    
    let lightLeftGradientColor: UIColor = UIColor(red: 46.0/255.0, green:76.0/255.0, blue: 72.0/255.0, alpha: 1.0)
    let leftGradientColor: UIColor = UIColor(red: 24.0/255.0, green:49.0/255.0, blue: 46.0/255.0, alpha: 1.0)
    let rightGradientColor: UIColor = UIColor(red:0.0/255.0, green:21.0/255.0, blue: 19.0/255.0, alpha: 1.0)

    let dateTextLightGreen: UIColor = UIColor(red:89.0/255.0, green:177.0/255.0, blue: 167.0/255.0, alpha: 1.0)
    
    let lightGray: UIColor = UIColor(red: 183.0/255.0, green: 183.0/255.0, blue: 183.0/255.0, alpha: 1.0)
    let darkGray: UIColor = UIColor(red: 34.0/255.0, green:34.0/255.0, blue: 34.0/255.0, alpha: 1.0)
    let lightGreen: UIColor = UIColor(red: 0.0/255.0, green:205.0/255.0, blue: 182.0/255.0, alpha: 1.0)
    let darkGreen: UIColor = UIColor(red: 23.0/255.0, green: 159.0/255.0, blue: 144.0/255.0, alpha: 1.0)
    let darkGreen2: UIColor = UIColor(red: 34.0/255.0, green: 191.0/255.0, blue: 172.0/255.0, alpha: 1.0)
    let orange: UIColor = UIColor(red: 239.0/255.0, green:109.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    let darkGreyBackground: UIColor = UIColor(red: 40.0/255.0, green:40.0/255.0, blue: 40.0/255.0, alpha: 1.0)
    let lightGreyBackground: UIColor = UIColor(red: 68.0/255.0, green:68.0/255.0, blue: 68.0/255.0, alpha: 1.0)
    let starFillColor: UIColor = UIColor(red: 254.0/255.0, green: 208.0/255.0, blue: 47.0/255.0, alpha: 1.0)
    
    
    let darkerLabelGreen = UIColor(red: 57.0/255.0, green: 206.0/255.0, blue:190.0/255.0, alpha: 1.0)
    let solidDarkBackgroundGreen = UIColor(red: 6.0/255.0, green: 28.0/255.0, blue:26.0/255.0, alpha: 1.0)
}
