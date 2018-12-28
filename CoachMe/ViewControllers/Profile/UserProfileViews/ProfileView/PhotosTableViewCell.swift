//
//  PhotosTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/15/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var imgOne: UIImageView!
    @IBOutlet weak var imgTwo: UIImageView!
    @IBOutlet weak var imgThree: UIImageView!
    @IBOutlet weak var imgFour: UIImageView!
    @IBOutlet weak var view: UIView!
    let photosCellHeight = CGFloat(integerLiteral: 430)
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.addShadows()
        addGestures()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func viewAll(_ sender: Any) {
        
    }
    
    func addGestures(){
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        tapOne.delegate = self
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        tapTwo.delegate = self
        let tapThree = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        tapThree.delegate = self
        let tapFour = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        tapFour.delegate = self
        
        imgOne.isUserInteractionEnabled = true
        imgOne.addGestureRecognizer(tapOne)
        imgTwo.isUserInteractionEnabled = true
        imgTwo.addGestureRecognizer(tapTwo)
        imgThree.isUserInteractionEnabled = true
        imgThree.addGestureRecognizer(tapThree)
        imgFour.isUserInteractionEnabled = true
        imgFour.addGestureRecognizer(tapFour)
    }
    
    
    @objc func tappedImage(_ sender: Any) {
        print("Pressed sender")
        let gesture = sender as! UIGestureRecognizer
        if let imageView = gesture.view as? UIImageView {
            let newImageView = UIImageView(image: imageView.image)
            newImageView.frame = UIScreen.main.bounds
            newImageView.backgroundColor = UIColor.black
            newImageView.contentMode = .scaleAspectFit
            newImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
            tap.delegate = self
            newImageView.addGestureRecognizer(tap)
            window?.rootViewController!.view.addSubview(newImageView)
            window?.rootViewController!.navigationController?.isNavigationBarHidden = true
            window?.rootViewController!.tabBarController?.tabBar.isHidden = true
        }
    }
    
    @objc func dismissScreen(_ sender: UITapGestureRecognizer) {
        window?.rootViewController!.navigationController?.isNavigationBarHidden = false
        window?.rootViewController!.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
}
