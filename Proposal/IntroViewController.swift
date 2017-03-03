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
    
    @IBAction func presentTest() {
        
        let floorPlanViewController = FloorPlanViewController(nibName: FloorPlanViewController.className, bundle: nil)
        navigationController?.pushViewController(floorPlanViewController, animated: true)
    }
}
