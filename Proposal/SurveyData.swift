//
//  SurveyData.swift
//  Proposal
//
//  Created by Ryan Campanella on 3/1/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import Foundation

struct SurveyData {
    let title: String
    let dataLabels: [String]
    let dataSetIdentifiers: [String]
    let values: [[Double]]
}

extension SurveyData {
    
    static func getGraphData(surveyNumber: Int) -> SurveyData? {
        switch surveyNumber {
        case 0:
            return SurveyData(title: "J&J Employee Happiness in Open Space",
                              dataLabels: ["Open Space Employees"],
                              dataSetIdentifiers: ["Very Happy", "Happy", "Neutral", "Unhappy", "Very Unhappy"],
                              values: [[19.0, 19.0, 7.0, 9.0, 1.0]])
        default:
            return nil
        }
    }
}
