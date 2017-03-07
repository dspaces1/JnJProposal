//
//  VideoGridCollectionViewCell.swift
//  Proposal
//
//  Created by Stephen Hayes on 3/2/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    var playerViewController = AVPlayerViewController()
    var profile: Profile!
    
    override func prepareForReuse() {
        videoView.alpha = 0.0
        videoView.isHidden = true
    }
    
    func setUp(with profile: Profile) {
        self.profile = profile
        
        titleLabel.text = profile.name
        imageView.image = profile.image
    }
    
    func loadVideo() {
//        guard let path = Bundle.main.path(forResource: "Will", ofType: "mov") else { return }
//        
//        let videoUrl = URL(fileURLWithPath: path)
        let player = AVPlayer(url: profile.videoURL)
        
        playerViewController.player = player
        playerViewController.view.frame = videoView.frame
        
        videoView.addSubview(playerViewController.view)
    }
}
