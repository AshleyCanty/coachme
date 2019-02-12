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
    
    func createImages(_ imgNames: [String]) -> [UIImage]{
        var imgArray = [UIImage]()
        for i in 0..<imgNames.count {
            let imgView = UIImage(imageLiteralResourceName: imgNames[i])
            imgArray.append(imgView)
        }
        return imgArray
    }
    
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
        image.layer.borderWidth = 1.5
        image.layer.borderColor = UIColor.white.cgColor
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

extension UITableViewCell {
    func setClearBackground() {
        let bgView: UIView = UIView()
        bgView.backgroundColor = UIColor.clear
        
        self.backgroundView = bgView
        self.backgroundColor = UIColor.clear
    }
}

extension UITextView {
    func addTailAndCutLines (_ lineBreak: NSLineBreakMode, _ lines: Int) {
        textContainer.lineBreakMode = lineBreak
        textContainer.maximumNumberOfLines = lines
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

extension UITextView {
    func highlightInputBox() {
        layer.masksToBounds = false
        layer.shadowColor = Colors().lightGreen.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.6
    }
    
    func removeHighlight() {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0
    }
}

extension UITextField {
    func highlightInputBox() {
        layer.masksToBounds = false
        layer.shadowColor = Colors().lightGreen.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.6
    }
    
    func removeHighlight() {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0
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
        layer.shadowRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.shadowOpacity = 0.35
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
        let lineView = UIView(frame: CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: 2))
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
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = frame
        rectShape.position = center
        rectShape.path = maskPath1.cgPath
        clipsToBounds = true
        layer.masksToBounds = true
        
        layer.mask = rectShape
    }
}

extension UIImageView {
    public func roundImageCorners(_ corners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: 8, height: 8))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func makeRoundedUserProfileImage(){
        layer.masksToBounds = false
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }
}

extension String {
    func isEmailValid() -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "Self MATCHES%@", emailReg)
        return emailTest.evaluate(with: self)
    }
}

