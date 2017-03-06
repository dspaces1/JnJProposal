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
    let description: String
    let labels: [String]
    let values: [Double]
}

extension SurveyData {
    
    static func getGraphData(surveyNumber: Int) -> SurveyData? {
        switch surveyNumber {
        case 0:
            return SurveyData(title: "J&J Employee Satisfaction in Open Space",
                              description: "Percentage of Employees",
                              labels: ["Happy", "Neutral", "Unhappy"],
                              values: [38.0, 7.0, 10.0])
        case 1:
            return SurveyData(title: "J&J Employee Satisfaction in Closed Space",
                              description: "Percentage of Employees",
                              labels: ["Happy", "Neutral", "Unhappy"],
                              values: [9.0, 1.0, 6.0])
        case 2:
            return SurveyData(title: "Student and Graduate Talent Job Search Preferences",
                              description: "Percentage of Individuals",
                              labels: ["Type of Work", "Work Location", "Workspace", "Company Reputation"],
                              values: [69.0, 13.0, 18.0, 12.0])
        case 3:
            return SurveyData(title: "Student and Graduate Talent Workspace Preferences",
                              description: "Percentage of Individuals",
                              labels: ["Open Space", "Closed Space", "Other"],
                              values: [13.0, 5.0, 1.0])
        default:
            return nil
        }
    }
}
