//
//  VideoGridCollectionViewCell.swift
//  Proposal
//
//  Created by Stephen Hayes on 3/2/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class VideoGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    override func prepareForReuse() {
        videoView.alpha = 0.0
        videoView.isHidden = true
    }
}
