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

    @IBAction func presentTest() {
        let floorPlanViewController = FloorPlanViewController(nibName: FloorPlanViewController.className, bundle: nil)
        navigationController?.pushViewController(floorPlanViewController, animated: true)
    }
    
    @IBAction func presentVideoGrid() {
        let videoGridViewController = VideoGridViewController(nibName: VideoGridViewController.className, bundle: nil)
        navigationController?.pushViewController(videoGridViewController, animated: true)
    }
}
