////
////  StringFunctions.swift
////  CoachMe
////
////  Created by ashley canty on 12/8/18.
////  Copyright © 2018 ashley canty. All rights reserved.
////
//
//import Foundation
//
//class StringFunctions {
//
//
//}
//
//
//
////
////  LoginViewController.swift
////  CoachMe
////
////  Created by ashley canty on 11/19/18.
////  Copyright © 2018 ashley canty. All rights reserved.
////
//
//import UIKit
//
//
//
//class LoginViewController: UIViewController {
//
//    @IBOutlet weak var logo: UIImageView!
//    @IBOutlet weak var username: UITextField!
//    @IBOutlet weak var password: UITextField!
//    @IBOutlet weak var mainTitle: UILabel!
//    @IBOutlet weak var loginButton: UIButton!
//    @IBOutlet weak var signupLink: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setAllText()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        username.center.y += view.bounds.height
//        password.center.y += view.bounds.height
//        loginButton.center.y += view.bounds.height
//        signupLink.center.y += view.bounds.height
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//
//        self.username.alpha = 0
//        self.password.alpha = 0
//        self.loginButton.alpha = 0
//        self.signupLink.alpha = 0
//        self.mainTitle.alpha = 0
//
//        let originalTransform = self.logo.transform
//        let scaledTransform = originalTransform.scaledBy(x: 0.85, y: 0.85)
//        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0.0, y: -70.0)
//
//        // TODO make array that executes multiple scales
//        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseInOut], animations: {
//            self.logo.transform = scaledAndTranslatedTransform
//        }, completion: nil)
//        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseOut], animations: {
//            self.mainTitle.alpha = 1.0
//            self.mainTitle.center.y -= self.logo.center.y + self.logo.bounds.height - 31
//        })
//        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
//            self.animateUIViews()
//        })
//    }
//
//    func animateUIViews(){
//        if view.bounds.height > 667 {
//            UIView.animate(withDuration: 1.3, delay: 0.6, options: [.curveEaseInOut], animations: {
//                self.username.center.y -= self.view.center.y - 100
//                self.username.alpha = 1.0
//            }, completion: nil)
//            UIView.animate(withDuration: 1.3, delay: 0.78, options: [.curveEaseInOut], animations: {
//                self.password.alpha = 1.0
//                self.password.center.y -= self.view.center.y - 162
//            }, completion: nil)
//            UIView.animate(withDuration: 1.3, delay: 0.8, options: [.curveEaseInOut], animations: {
//                self.loginButton.alpha = 1.0
//                self.loginButton.frame.origin.y -= self.view.center.y - 254
//            }, completion: nil)
//            UIView.animate(withDuration: 0.0, delay: 0.0, options: [.curveEaseInOut], animations: {
//                self.signupLink.frame.origin.y -= self.view.center.y - 310
//            }, completion: nil)
//            UIView.animate(withDuration: 1.3, delay: 1.8, options: [.curveEaseOut], animations: {
//                self.signupLink.alpha = 1.0
//            }, completion: nil)
//        } else {
//            UIView.animate(withDuration: 1.5, delay: 1.0, options: [.curveEaseOut], animations: {
//                self.username.alpha = 1.0
//            }, completion: nil)
//            UIView.animate(withDuration: 1.5, delay: 1.5, options: [.curveEaseOut], animations: {
//                self.password.alpha = 1.0
//            }, completion: nil)
//            UIView.animate(withDuration: 3.7, delay: 1.10, options: [.curveEaseOut], animations: {
//                self.loginButton.alpha = 1.0
//            }, completion: nil)
//
//
//            UIView.animate(withDuration: 1.3, delay: 0.6, options: [.curveEaseOut], animations: {
//                self.username.center.y -= self.view.center.y - 70
//            }, completion: nil)
//            UIView.animate(withDuration: 1.3, delay: 0.62, options: [.curveEaseOut], animations: {
//                self.password.center.y -= self.view.center.y - 132
//            }, completion: nil)
//            UIView.animate(withDuration: 1.3, delay: 0.9, options: [.curveEaseOut], animations: {
//                self.loginButton.frame.origin.y -= self.view.center.y - 224
//            }, completion: nil)
//            UIView.animate(withDuration: 0, delay: 0.0, options: [], animations: {
//                self.signupLink.frame.origin.y -= self.view.center.y - 280
//            }, completion: nil)
//            UIView.animate(withDuration: 1.2, delay: 2.1, options: [.curveEaseOut], animations: {
//                self.signupLink.alpha = 1.0
//            }, completion: nil)
//        }
//    }
//
//    func textFade(){
//        mainTitle.alpha = 0
//        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
//            UIView.animate(withDuration: 1.5, animations: {
//                self.mainTitle.alpha = 1.0
//                self.mainTitle.center.y -= self.logo.center.y - (self.logo.bounds.height + 100)
//            })
//        })
//    }
//
//    @IBAction func startSignup(_ sender: Any) {
//        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignupOneViewController") as! SignupOneViewController
//        navigationController?.pushViewController(controller, animated: true)
//    }
//
//    func setAllText(){
//        let userImage = UIImage(named: "user.pdf")
//        let passwordImage = UIImage(named: "locked.pdf")
//        username.placeholderEdit(StaticStrings.username)
//        username.addLeftImage(userImage!)
//        password.placeholderEdit(StaticStrings.password)
//        password.addLeftImage(passwordImage!)
//        changeTextColor()
//    }
//
//    func changeTextColor(){
//        let string = StaticStrings.coachMe
//        let range1 = (string as NSString).range(of: "Me")
//        let range2 = (string as NSString).range(of: "coach")
//
//        let attr = NSMutableAttributedString(string: string)
//        attr.addAttribute(NSAttributedString.Key.foregroundColor,value: Colors().orange , range: range1)
//        attr.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors().darkGreen, range: range2)
//        mainTitle.attributedText = attr
//    }
//
//}
//
//extension UITextField{
//    func setPadding(){
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: self.frame.height))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//    }
//
//    func setBottomBorder(){
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        self.layer.shadowOpacity = 1.0
//        self.layer.shadowRadius = 0.0
//    }
//
//    func placeholderEdit(_ text: String){
//        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 120.0/255.0, green:176.0/255.0, blue: 186.0/255.0, alpha: 1.0)])
//    }
//
//    func addLeftImage(_ img: UIImage){
//        let leftImageView = UIImageView(frame: CGRect(x: 15, y: 0.0, width: img.size.width, height: img.size.height))
//
//        leftImageView.image = img
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 25))
//        view.addSubview(leftImageView)
//        self.leftView = view
//        self.leftViewMode = .always
//    }
//
//}
//
//
