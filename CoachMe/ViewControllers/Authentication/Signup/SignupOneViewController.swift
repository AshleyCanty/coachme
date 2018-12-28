//
//  SignupOneViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/3/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class SignupOneViewController: UIViewController {
    
    var coachLeadingAnchor: NSLayoutConstraint?
    var coachTrailingAnchor: NSLayoutConstraint?
    var menteeLeadingAnchor: NSLayoutConstraint?
    var menteeTrailingAnchor: NSLayoutConstraint?
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var signup: UILabel!
    @IBOutlet weak var selectRole: UILabel!
    @IBOutlet weak var coach: UIButton!
    @IBOutlet weak var mentee: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func selectCoach(_ sender: Any) { pushToNextView() }
    
    @IBAction func selectMentee(_ sender: Any) { pushToNextView() }
    
    func setText(){
        signup.attributedText = Helpers().changeTextColor(NavigationTitles.Signup, "Sign", "up")
        selectRole.textColor = Colors().lightGreen
        coach.setTitle(StaticStrings.mentor, for: .normal)
        coach.layer.cornerRadius = 20
        mentee.setTitle(StaticStrings.mentee, for: .normal)
        mentee.layer.cornerRadius = 20
    }
    
    func pushToNextView(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupTwoViewController") as! SignupTwoViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    func buttonConstraints(){
        coach.translatesAutoresizingMaskIntoConstraints = false
        mentee.translatesAutoresizingMaskIntoConstraints = false
        
        coach.widthAnchor.constraint(equalToConstant: 120).isActive = true
        coach.heightAnchor.constraint(equalToConstant: 120).isActive = true
        coach.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        coachLeadingAnchor = coach.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        coachTrailingAnchor = coach.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        coachTrailingAnchor!.isActive = true
        
        mentee.widthAnchor.constraint(equalToConstant: 120).isActive = true
        mentee.heightAnchor.constraint(equalToConstant: 120).isActive = true
        mentee.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        menteeTrailingAnchor = mentee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        menteeLeadingAnchor = mentee.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        menteeLeadingAnchor!.isActive = true
    }
    
    func setButtons(){
        coachTrailingAnchor?.isActive = false
        coachLeadingAnchor?.isActive = true
        menteeLeadingAnchor?.isActive = false
        menteeTrailingAnchor?.isActive = true
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: [.curveEaseIn], animations: {
            self.coach.alpha = 1
            self.mentee.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
