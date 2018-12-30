//
//  Helpers.swift
//  CoachMe
//
//  Created by ashley canty on 12/11/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import WebKit
import AVKit

class Helpers: UIView {
    
    
    func createCustomVideo(_ videoId: String) -> AVPlayerViewController {
        let videoPlayer = AVPlayerViewController()
        if let path = Bundle.main.path(forResource: videoId, ofType: "mp4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            videoPlayer.player = video
//            self.present(videoPlayer, animated: true, completion: {
//                video.play()
//            })
        }
        return videoPlayer
    }
    
    func createYoutubeVideo(_ webview: WKWebView,_ videoCode: String){
        let url = URL(string: "https:www.youtube.com/embed/\(videoCode)")
        
        webview.backgroundColor = UIColor.black
        webview.isOpaque = false
        webview.addShadows()
        webview.load(URLRequest(url: url!))
    }
    
    
    func setProfileTab(_ value: String, _ key: String) {
        if UserDefaults.standard.string(forKey: key) != value {
            UserDefaults.standard.set(value, forKey: key)
        }
    }
    
    func changeTextColor(_ string: String,_ firstRange: String,_ secondRange: String) -> NSMutableAttributedString {
        
        let firstRange = (string as NSString).range(of: firstRange)
        let secondRange = (string as NSString).range(of: secondRange)
        
        let attr = NSMutableAttributedString(string: string)
        attr.addAttribute(NSAttributedString.Key.foregroundColor,value: Colors().lightGreen, range: firstRange)
        attr.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors().orange, range: secondRange)
        return attr
    }
    
    func changeBGColor(_ params: [UIButton]){
        let bgColor = params[0].backgroundColor
        
        if bgColor != Colors().lightGreen {
            params[0].backgroundColor = Colors().lightGreen
            params[1].backgroundColor = Colors().lightGreyBackground
            params[2].backgroundColor = Colors().lightGreyBackground
        }
        
    }
    
    func makeRounded(_ image: UIImageView){
//        image.layer.borderWidth = 1.5
//        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.width/2
        image.clipsToBounds = true
    }
    
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension NSLayoutConstraint {
    func controlConstraints(_ constraints: [NSLayoutConstraint],_ status: [Bool]){
        let c = constraints.count-1
        
        for num in 0...c {
            print(num)
            constraints[num].isActive = status[num]
        }
    }
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions.alignAllCenterX
            , metrics: nil, views: viewsDictionary))
    }
    
    func addShadows() {
        let shadowpath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), cornerRadius: 8.0)
        
        layer.shadowPath = shadowpath.cgPath
        
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.shadowOpacity = 0.15
        layer.shadowPath = shadowPath.cgPath
    }
}

extension UITextView {
    func addCharacterSpacing(kernValue: Double = 1.15) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}



extension UIButton {
    
    
    // add bottom border to stackview, align with centerX of buttons
    // uiview.animate to move border to each button
    
    func bottomBorder(){
        var lineView = UIView(frame: CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: 2))
        lineView.backgroundColor = UIColor.white
        addSubview(lineView)

    }
    
    func roundedButton(_ corners: UIRectCorner){
        let maskPath1: UIBezierPath!
        
        if corners == [.allCorners] {
            maskPath1 = UIBezierPath(roundedRect: bounds,
                                         byRoundingCorners: corners,
                                         cornerRadii: CGSize(width: frame.width/2, height: frame.width/2))
            
//            contentMode = UIView.ContentMode.scaleAspectFill
            imageView?.contentMode = .scaleAspectFill
        } else {
            maskPath1 = UIBezierPath(roundedRect: bounds,
                                         byRoundingCorners: corners,
                                         cornerRadii: CGSize(width: 8, height: 8))
        }
        
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}

