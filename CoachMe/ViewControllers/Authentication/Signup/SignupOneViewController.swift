//
//  SignupOneViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/3/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class SignupOneViewController: UIViewController {
    var selectedRole: String?

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var signup: UILabel!
    @IBOutlet weak var selectRole: UILabel!
    @IBOutlet weak var mentorButton: UIButton!
    @IBOutlet weak var menteeButton: UIButton!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var mentorView: UIView!
    @IBOutlet weak var menteeView: UIView!
    @IBOutlet weak var mentorWrap: UIView!
    @IBOutlet weak var menteeWrap: UIView!
    
    var fadedWrapperView: UIView = UIView()
    var blackoutView: UIView = UIView()
    var checkMark: UIImageView = UIImageView()
    var buttonPressed: Bool  = false
    var buttonTag: Int!
    var blackoutButton: UIButton!
    var userId: String  = ""
    var email: String = ""
    var socialFirstName: String!
    var socialLastName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration"
        setupViews()
        print("SIGNUP ONE VIEW CONtrolleR \(socialFirstName) \(socialLastName)")
        print(email, userId)
        
    }
    
    func setupViews() {
        
        if socialFirstName != "" && socialLastName != "" {
            firstName.text = socialFirstName
            lastName.text = socialLastName
            firstName.isUserInteractionEnabled = false
            lastName.isUserInteractionEnabled = false
        }
        
        signup.attributedText = Helpers().changeTextColor(NavigationTitles.Signup, "Sign", "up")
        view.backgroundColor = UIColor.clear
        view.insertSubview(view.setGradientBackground(Colors().leftGradientColor, Colors().rightGradientColor), at: 0)
        mentorView.layer.cornerRadius = 5
        mentorView.layer.masksToBounds = true
        menteeView.layer.cornerRadius = 5
        menteeView.layer.masksToBounds = true
        mentorButton.tag = 1
        menteeButton.tag = 2
        
        checkMark = UIImageView(image: UIImage(named: "greenCircle"))
        checkMark.contentMode = .scaleAspectFit
        checkMark.frame.size = CGSize(width: 40, height: 40)
        checkMark.layer.shadowColor = UIColor.black.cgColor
        checkMark.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        checkMark.layer.shadowOpacity = 0.50
        checkMark.layer.shadowRadius = 8
        
        let underlayer = UIView()
        underlayer.backgroundColor = UIColor.clear
        underlayer.frame = checkMark.frame
        underlayer.layer.cornerRadius = underlayer.frame.width/2
        underlayer.layer.masksToBounds = true
        checkMark.insertSubview(underlayer, at: 0)
        checkMark.sendSubviewToBack(underlayer)
        
    }
    
    @IBAction func setSelected(_ sender: UIButton) {
        if sender.tag == 1 {
            selectedRole = "mentor"
            mentorWrap.addSubview(checkMark)
            checkMark.center.x = mentorButton.frame.maxX
            checkMark.center.y = 0
            mentorButton.backgroundColor = UIColor.clear
            menteeButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
        } else {
            selectedRole = "mentee"
            menteeWrap.addSubview(checkMark)
            checkMark.center.x = menteeButton.frame.maxX
            checkMark.center.y = 0
            menteeButton.backgroundColor = UIColor.clear
            mentorButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
        }
    }
    
    @IBAction func pushToNextView(){
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        if selectedRole == ""{
           let alert = UIAlertController(title: "No role selected", message: "Please select a role", preferredStyle: .alert)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if firstName.text == "" {
            let alert = UIAlertController(title: "Invalid first name", message: "Please provide a first name", preferredStyle: .alert)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if lastName.text == "" {
            let alert = UIAlertController(title: "Invalid last name", message: "Please provide a last name", preferredStyle: .alert)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SignupTwoViewController") as! SignupTwoViewController
            vc.selectedRole = selectedRole
            vc.firstName = firstName.text
            vc.lastName = lastName.text
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func setButtons(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: [.curveEaseIn], animations: {
            self.mentorButton.alpha = 1
            self.menteeButton.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

extension UIButton {
    func addCheckmarkToButton(){
        let view = UIView()
        view.bounds = bounds
        view.frame = frame
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        
        let checkmarkImage = UIImageView(image: UIImage(named: "greenCircle"))
        checkmarkImage.frame.size = CGSize(width: 40, height: 40)
        checkmarkImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(checkmarkImage)
        addSubview(view)
        bringSubviewToFront(view)
        
        checkmarkImage.center.x = bounds.maxX
        checkmarkImage.center.y = 0
    }
}
