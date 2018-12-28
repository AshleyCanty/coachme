//
//  LoginViewController.swift
//  CoachMe
//
//  Created by ashley canty on 11/19/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {

    var titleTopAnchor: NSLayoutConstraint?
    var titleCenterYAnchor: NSLayoutConstraint?
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupLink: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllText()
        
        UINavigationBar.appearance().barTintColor = Colors().darkGreyBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func startSignup(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignupOneViewController") as! SignupOneViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func setAllText(){
        let userImage = UIImage(named: "user.pdf")
        let passwordImage = UIImage(named: "locked.pdf")
        username.attributedPlaceholder = NSAttributedString(string: StaticStrings.username, attributes: [NSAttributedString.Key.foregroundColor: Colors().lightGray])
        username.addLeftImage(userImage!)
        password.attributedPlaceholder = NSAttributedString(string: StaticStrings.password, attributes: [NSAttributedString.Key.foregroundColor: Colors().lightGray])
        password.addLeftImage(passwordImage!)
        mainTitle.attributedText = Helpers().changeTextColor(StaticStrings.coachMe, "coach", "Me")
    }
    
}

extension UITextField{
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func placeholderEdit(_ text: String){
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 120.0/255.0, green:176.0/255.0, blue: 186.0/255.0, alpha: 1.0)])
    }
    
    func addLeftImage(_ img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 15, y: 0.0, width: img.size.width, height: img.size.height))
        
        leftImageView.image = img
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 25))
        view.addSubview(leftImageView)
        self.leftView = view
        self.leftViewMode = .always
    }
    
}

