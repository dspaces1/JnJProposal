//
//  IntroViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 2/25/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentSurvey() {
        let surveyChartViewController = SurveyChartsViewController(nibName: SurveyChartsViewController.className, bundle: nil)
        navigationController?.pushViewController(surveyChartViewController, animated: true)
    }
    
    @IBAction func presentVideoGrid() {
        let videoGridViewController = VideoGridViewController(nibName: VideoGridViewController.className, bundle: nil)
        navigationController?.pushViewController(videoGridViewController, animated: true)
    }
    
    @IBAction func playGarageVideo(_ sender: Any) {
        let youtubeId = "-xNN-bJQ4vI"
        var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(youtubeUrl as URL) {
            UIApplication.shared.open(youtubeUrl as URL, options: [:], completionHandler: nil)
            
        } else {
            youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.open(youtubeUrl as URL, options: [:], completionHandler: nil)
        }
    }
}
