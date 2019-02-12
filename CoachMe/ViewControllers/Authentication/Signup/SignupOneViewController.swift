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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        self.title = "Select a Role"
        view.backgroundColor = UIColor.clear
        view.insertSubview(view.setGradientBackground(Colors().leftGradientColor, Colors().rightGradientColor), at: 0)
        mentorView.layer.cornerRadius = 5
        mentorView.layer.masksToBounds = true
        menteeView.layer.cornerRadius = 5
        menteeView.layer.masksToBounds = true
    }
    
    @IBAction func selectedMentor(_ sender: Any) {
        selectedRole = "Mentor"
        addCheckmarkToButton()
        
    }
    
    @IBAction func selectedMentee(_ sender: Any) {
        selectedRole = "Mentee"
        addCheckmarkToButton()
    }
    
    func addCheckmarkToButton(){
        let view = UIView()
        view.bounds = mentorView.bounds
        view.frame = mentorView.frame
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        
        let checkmarkImage = UIImageView(image: UIImage(named: "success"))
        checkmarkImage.frame.size = CGSize(width: 30, height: 30)
        checkmarkImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(checkmarkImage)
        mentorView.addSubview(view)
        
        
        checkmarkImage.center.x =
        checkmarkImage.center.y = view.bounds.minY
        
        
    }
    
    func setText(){
        signup.attributedText = Helpers().changeTextColor(NavigationTitles.Signup, "Sign", "up")
    }
    
    @IBAction func pushToNextView(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupTwoViewController") as! SignupTwoViewController
        vc.selectedRole = selectedRole
        vc.firstName = firstName.text
        vc.lastName = lastName.text
        navigationController?.pushViewController(vc, animated: true)
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
    

}
