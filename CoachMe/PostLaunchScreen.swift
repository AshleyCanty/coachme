//
//  PostLaunchScreen.swift
//  CoachMe
//
//  Created by ashley canty on 12/3/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class PostLaunchScreen: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        textFade()
        changeTextColor()
        delayLoginScreen()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.center.y += self.view.bounds.height
    }
    
    func changeTextColor(){
        let string = "coachMe"
        let range1 = (string as NSString).range(of: "Me")
        let range2 = (string as NSString).range(of: "coach")
        
        let attr = NSMutableAttributedString(string: string)
        attr.addAttribute(NSAttributedString.Key.foregroundColor,value: Colors().orange , range: range1)
        attr.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors().darkGreen, range: range2)
        mainTitle.attributedText = attr
    }
    
    func textFade(){
        mainTitle.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            UIView.animate(withDuration: 1.5, animations: {
                self.mainTitle.alpha = 1.0
                self.mainTitle.center.y -= self.logo.center.y - (self.logo.bounds.height + 100)
            })
            print("f")
        })
    }
    
    func delayLoginScreen(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(vc, animated: true, completion: nil)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
