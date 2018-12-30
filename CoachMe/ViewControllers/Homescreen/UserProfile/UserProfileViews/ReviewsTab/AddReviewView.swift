//
//  AddReviewView.swift
//  CoachMe
//
//  Created by ashley canty on 12/29/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class AddReviewView: UIView {
    
    let container = UIView()
    let header = UILabel()
    let rateQuestion = UILabel()
    let textbox = UITextView()
    let charCount = UILabel()
    let submitBtn = UIButton(type: .system)
    let cancelBtn = UIButton(type: .system)
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.settings.emptyBorderColor = Colors().lightGray
        view.settings.filledColor = Colors().starFillColor
        view.settings.filledBorderColor = Colors().starFillColor
        view.settings.emptyImage = UIImage(named: "emptyStar")?.withRenderingMode(.alwaysOriginal)
        view.settings.filledImage = UIImage(named: "fullStar")?.withRenderingMode(.alwaysOriginal)
        return view
        
    }()
    
    lazy var borderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        view.frame.size.height = 1
        view.frame.size.width = 100
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainView: UIView = {
        let superViewHeight = CGFloat((UIApplication.shared.keyWindow?.frame.height)!)
        let superViewWidth = CGFloat((UIApplication.shared.keyWindow?.frame.width)!)
        
        let mainView = UIView()
        mainView.frame.size = CGSize(width: superViewWidth, height: superViewHeight)
        mainView.center.y = (UIApplication.shared.keyWindow?.center.y)!
        mainView.center.x = -mainView.frame.width/2
        mainView.backgroundColor = Colors().darkGreyBackground
        
        var buttonStackView = UIStackView(arrangedSubviews: [submitBtn, cancelBtn])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 30
        buttonStackView.distribution = .fillEqually
        
        mainView.addSubview(container)
        container.addSubview(header)
        container.addSubview(rateQuestion)
        container.addSubview(textbox)
        container.addSubview(charCount)
        container.addSubview(buttonStackView)
        container.addSubview(cosmosView)
        container.addSubview(borderBottom)
        
//        submitBtn.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        submitBtn.tag = 1
        cancelBtn.addTarget(self, action: #selector(removeAddReviews), for: .touchUpInside)
        cancelBtn.tag = 1
        
        container.layer.cornerRadius = 8
        container.clipsToBounds = true
        textbox.layer.cornerRadius = 8
        textbox.clipsToBounds = true
        submitBtn.layer.cornerRadius = 8
        submitBtn.clipsToBounds = true
        cancelBtn.layer.cornerRadius = 8
        cancelBtn.clipsToBounds = true
        
        container.backgroundColor = Colors().lightGreyBackground
        header.backgroundColor = Colors().lightGreen
        rateQuestion.textColor = UIColor.white
        textbox.backgroundColor = UIColor.white
        submitBtn.backgroundColor = Colors().lightGreen
        cancelBtn.backgroundColor = Colors().lightGreen
        
        header.text = "Add a review"
        header.textColor = UIColor.white
        header.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        header.textAlignment = NSTextAlignment.center
        rateQuestion.text = "How would you rate this experience?"
        textbox.text = "Write a review (optional)"
        textbox.textColor = UIColor.lightGray
        textbox.font = UIFont.systemFont(ofSize: 16)
        charCount.text = "400"
        charCount.textAlignment = .right
        charCount.textColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.7)
        submitBtn.titleLabel?.textColor = UIColor.white
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.setTitleColor(UIColor.white, for: .normal)
        submitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        cancelBtn.titleLabel?.textColor = UIColor.white
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        
        var allConstraints: [NSLayoutConstraint] = []
        let views: [String: Any] = ["container": container, "header": header, "rateQuestion": rateQuestion, "textbox": textbox, "charCount": charCount, "buttonStackView":buttonStackView]
        
        container.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false
        rateQuestion.translatesAutoresizingMaskIntoConstraints = false
        textbox.translatesAutoresizingMaskIntoConstraints = false
        charCount.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8).isActive = true
        cosmosView.topAnchor.constraint(equalTo: rateQuestion.bottomAnchor, constant: 8).isActive = true
        
        borderBottom.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8).isActive = true
        borderBottom.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 8).isActive = true
        borderBottom.topAnchor.constraint(equalTo: cosmosView.bottomAnchor, constant: 10).isActive = true
        
        
        let containerVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[container]", options: [], metrics: nil, views: views)
        allConstraints += containerVerticalConstraints
        let containerHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[container]-12-|", options: [], metrics: nil, views: views)
        allConstraints += containerHorizontalConstraints
        
        let VerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[header(50)]-16-[rateQuestion(15)]-50-[textbox(180)]-8-[charCount(12)]-16-[buttonStackView(45)]-8-|", options: [], metrics: nil, views: views)
        allConstraints += VerticalConstraints
        
        let headerHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[header]-0-|", options: [], metrics: nil, views: views)
        allConstraints += headerHorizontalConstraints
        
        let rateQuestionHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[rateQuestion]-|", options: [], metrics: nil, views: views)
        allConstraints += rateQuestionHorizontalConstraints
        
        let textboxHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[textbox]-8-|", options: [], metrics: nil, views: views)
        allConstraints += textboxHorizontalConstraints
        
        let charCountHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[charCount]-8-|", options: [], metrics: nil, views: views)
        allConstraints += charCountHorizontalConstraints
        
        let buttonStackHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-8-[buttonStackView]-8-|", options: [], metrics: nil, views: views)
        allConstraints += buttonStackHorizontalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
        return mainView
        
    }()

    @objc func addReviewClicked() {
        UIApplication.shared.keyWindow?.addSubview(self.mainView)
        UIApplication.shared.keyWindow?.bringSubviewToFront(self.mainView)
        mainView.center.x = -mainView.frame.width/2
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            self.textbox.text = StaticStrings.LeaveReview
            self.mainView.center.x = self.center.x
        })
    }
    
    @objc func removeAddReviews(){
        self.mainView.removeFromSuperview()
    }
}
