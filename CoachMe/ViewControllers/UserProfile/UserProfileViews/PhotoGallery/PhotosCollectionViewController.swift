//
//  PhotosCollectionViewController.swift
//  CoachMe
//
//  Created by ashley canty on 12/26/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    var imgNames = StaticStrings.UserProfileImages
    var imgArray = [UIImage]()
    var xPositionArray = [CGFloat]()
    
    let scrollview: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgArray = Helpers().createImages(imgNames)
    }
    
    
    func setupImages(_ images: [UIImage],_ index: Int, _ scrollview: UIScrollView) {
        for i in 0..<images.count {
            
            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollview.frame.width, height: scrollview.frame.height)
            imageView.contentMode = .scaleAspectFit
            
            scrollview.contentSize.width = scrollview.frame.width * CGFloat(i+1)
            xPositionArray.append(xPosition)
            scrollview.addSubview(imageView)
            scrollview.delegate = self as UIScrollViewDelegate
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgNames.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        let currentImg =  imgArray[indexPath.row]
        let btn = UIButton(type: .custom)
        btn.tag = indexPath.row
        btn.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
        btn.setImage(currentImg, for: .normal)
        btn.backgroundColor = UIColor.red
        btn.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        btn.addTarget(self, action: #selector(tappedImage(_:)), for: .touchUpInside)
        cell.addSubview(btn)
        
        return cell
    }
    
    @objc func tappedImage(_ sender: UIButton) {
        let sub = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        sub.backgroundColor = UIColor.black
        UIApplication.shared.keyWindow?.addSubview(sub)
        sub.addSubview(scrollview)
        if sender.isKind(of: UIButton.self) {
            let i = sender.tag
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
            tap.delegate = self as? UIGestureRecognizerDelegate
            sub.addGestureRecognizer(tap)
            view.addSubview(sub)
            setupImages(imgArray, i, scrollview)
            scrollview.contentOffset = CGPoint(x: xPositionArray[i], y: 0)
            navigationController?.isNavigationBarHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }
    
    @objc func dismissScreen(_ sender: UITapGestureRecognizer) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        
        let numberOfItemsPerRow = 3.0
        let itemWidth = Double(collectionView.bounds.width - layout.minimumLineSpacing)/numberOfItemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
