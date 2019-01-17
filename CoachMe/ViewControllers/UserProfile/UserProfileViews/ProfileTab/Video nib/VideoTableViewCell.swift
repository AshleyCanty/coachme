//
//  VideoTableViewCell.swift
//  CoachMe
//
//  Created by ashley canty on 12/28/18.
//  Copyright © 2018 ashley canty. All rights reserved.
//

import UIKit
import AVKit
import WebKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var webView: WKWebView!
    
    
    var avPlayer: AVPlayer?
    var avPlayerViewConroller: AVPlayerViewController?
    var avPlayerLayer: AVPlayerLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMoviePlayer()
    }
    
    private func setupMoviePlayer() {
        
        // Create a new AVPlayer and AVPlayerLayer
        self.avPlayer = AVPlayer()
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        
        // We want video controls so we need an AVPlayerViewController
        avPlayerViewConroller = AVPlayerViewController()
        avPlayerViewConroller?.player = avPlayer
        
        // Insert the player into the cell view hierarchy and setup autolayout
        avPlayerViewConroller!.view.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(avPlayerViewConroller!.view, at: 0)
        avPlayerViewConroller!.view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        avPlayerViewConroller!.view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        avPlayerViewConroller!.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        avPlayerViewConroller!.view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
