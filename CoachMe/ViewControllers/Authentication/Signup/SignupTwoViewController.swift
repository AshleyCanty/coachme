//
//  SignupTwoViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/5/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class SignupTwoViewController: UIViewController {

    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var signup: UILabel!
    @IBOutlet weak var details: UILabel!
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: stack.bounds.width, height: stack.bounds.height)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
    @IBAction func goToNext(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupThreeViewController") as! SignupThreeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setText(){
        signup.attributedText = Helpers().changeTextColor(NavigationTitles.Signup, "Sign", "up")
        details.text = StaticStrings.joinNow
        
        name.layer.cornerRadius = 5
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor.clear.cgColor
        name.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: Colors().lightGray])
        
        email.layer.cornerRadius = 5
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor.clear.cgColor
        email.attributedPlaceholder = NSAttributedString(string: StaticStrings.email, attributes: [NSAttributedString.Key.foregroundColor: Colors().lightGray])
        
        number.layer.cornerRadius = 5
        number.layer.borderWidth = 1
        number.layer.borderColor = UIColor.clear.cgColor
        number.attributedPlaceholder = NSAttributedString(string: StaticStrings.number, attributes: [NSAttributedString.Key.foregroundColor: Colors().lightGray])
    }
}
