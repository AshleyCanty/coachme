//
//  PhotosTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/15/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var view: UIView!
    
    var imgArray = [UIImage]()
    var xPositionArray = [CGFloat()]
    let photosCellHeight = CGFloat(integerLiteral: 300)
    
    let scrollview: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.backgroundColor = UIColor(red: 6/255, green: 28/255, blue: 26/255, alpha: 1.0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCollectionViewCell")
        // Initialization code
        addGestures()
        imgArray = [UIImage(imageLiteralResourceName: "coach1"), UIImage(imageLiteralResourceName: "coach2"), UIImage(imageLiteralResourceName: "coach3")]
        
        customizeViewAllButton()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func customizeViewAllButton(){
        viewButton.layer.borderColor = Colors().lightGreen.cgColor
        viewButton.layer.borderWidth = 1
        viewButton.backgroundColor = UIColor.clear
        viewButton.layer.cornerRadius = 15
        
//        viewButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 10)
        let shadowView = UIView()
        shadowView.layer.cornerRadius = 15
        shadowView.frame = viewButton.frame
        shadowView.backgroundColor = Colors().solidDarkBackgroundGreen
        shadowView.addShadows()
        viewButton.insertSubview(shadowView, at: 0)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2.5, height: collectionView.bounds.height-24)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 2.5, bottom: 5, right: 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        cell.imageBox.image = imgArray[indexPath.row]
        return cell
    }
    
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
        
//        imgOne.tag = 0
//        imgOne.isUserInteractionEnabled = true
//        imgOne.addGestureRecognizer(tapOne)
//        imgTwo.tag = 1
//        imgTwo.isUserInteractionEnabled = true
//        imgTwo.addGestureRecognizer(tapTwo)
//        imgThree.tag = 2
//        imgThree.isUserInteractionEnabled = true
//        imgThree.addGestureRecognizer(tapThree)
//        imgFour.tag = 3
//        imgFour.isUserInteractionEnabled = true
//        imgFour.addGestureRecognizer(tapFour)
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
