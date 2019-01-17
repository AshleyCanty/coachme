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
    
    var imgArray = [UIImage]()
    var xPositionArray = [CGFloat()]
    let photosCellHeight = CGFloat(integerLiteral: 453)
    
    let scrollview: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    func setupImages(_ images: [UIImage],_ index: Int) {
        for i in 0..<images.count {
            
            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollview.frame.width, height: scrollview.frame.height)
            imageView.contentMode = .scaleAspectFit
            
            scrollview.contentSize.width = scrollview.frame.width * CGFloat(i+1)
            xPositionArray.append(scrollview.contentSize.width)
            scrollview.addSubview(imageView)
            scrollview.delegate = self as? UIScrollViewDelegate
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        view.addShadows()
        addGestures()
        imgArray = [imgOne.image, imgTwo.image, imgThree.image, imgFour.image] as! [UIImage]
//        imgArray = [UIImage(imageLiteralResourceName: "coach1"), UIImage(imageLiteralResourceName: "coach2"), UIImage(imageLiteralResourceName: "coach3")]
        
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
        
        imgOne.tag = 0
        imgOne.isUserInteractionEnabled = true
        imgOne.addGestureRecognizer(tapOne)
        imgTwo.tag = 1
        imgTwo.isUserInteractionEnabled = true
        imgTwo.addGestureRecognizer(tapTwo)
        imgThree.tag = 2
        imgThree.isUserInteractionEnabled = true
        imgThree.addGestureRecognizer(tapThree)
        imgFour.tag = 3
        imgFour.isUserInteractionEnabled = true
        imgFour.addGestureRecognizer(tapFour)
    }
    
    
    @objc func tappedImage(_ sender: Any) {
        print("Pressed sender")
        let sub = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        sub.backgroundColor = UIColor.black
        UIApplication.shared.keyWindow?.addSubview(sub)
        sub.addSubview(scrollview)
        let gesture = sender as! UIGestureRecognizer
        if (gesture.view as? UIImageView) != nil {
            let i = gesture.view!.tag
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
            tap.delegate = self
            sub.addGestureRecognizer(tap)
            window?.rootViewController!.view.addSubview(sub)
            setupImages(imgArray, gesture.view!.tag)
            scrollview.contentOffset = CGPoint(x: xPositionArray[i], y: 0)
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
