//
//  StatsViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/7/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
        
    @IBAction func playGarageVideo(_ sender: Any) {
        let youtubeId = "aatbOXUfq50"
        var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(youtubeUrl as URL) {
            UIApplication.shared.open(youtubeUrl as URL, options: [:], completionHandler: nil)
            
        } else {
            youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.open(youtubeUrl as URL, options: [:], completionHandler: nil)
        }
    }
}
