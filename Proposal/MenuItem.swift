//
//  MenuItem.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/6/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

enum MenuItem {
    case theMission
    case surveyResult
    case howWeWork
    case ourPeople
    case concepts
    case ourPlan
    
    var title: String {
        switch self {
        case .theMission: return "The Mission"
        case .surveyResult: return "Survey Results"
        case .howWeWork: return "How We Work"
        case .ourPeople: return "Our People"
        case .concepts: return "Our Concepts"
        case .ourPlan: return "Our \nPlan"
        }
    }
    
    var image: UIImage {
        switch self {
        case .theMission: return UIImage(named: "rocket")!
        case .surveyResult: return UIImage(named: "pieGraph")!
        case .howWeWork: return UIImage(named: "chain")!
        case .ourPeople: return UIImage(named: "people")!
        case .concepts: return UIImage(named: "lightBulb")!
        case .ourPlan: return UIImage(named: "plan")!
        }
    }
    
    static func all() -> [MenuItem] {
        return [.theMission, .surveyResult, .howWeWork, .ourPeople, .concepts, .ourPlan]
    }
}
