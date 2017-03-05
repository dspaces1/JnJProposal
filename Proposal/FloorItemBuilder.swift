//
//  FloorItemBuilder.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/5/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

struct FloorItemBuilder {
    
    let viewSize: CGRect
    
    func getDefault() -> [FloorItem] {
        let desk = ItemDetails.seatingDesk
        let deskWidth = desk.sizePercentage.width * viewSize.width
        let deskHeight = desk.sizePercentage.height * viewSize.height
        
        let deskItem = FloorItem(title: desk.title, image: desk.image, cost: desk.cost, isCollaborative: desk.isCollaborative, width: deskWidth, height: deskHeight)
        
        return [deskItem]
    }
}

enum ItemDetails {
    case cube
    case seatingDesk
    
    
    var title: String {
        switch self {
        case .cube: return "Cube"
        case .seatingDesk: return "Desk"
        }
    }
    
    var image: UIImage {
        switch self {
        case .cube: return UIImage()
        case .seatingDesk: return UIImage(named: "SeatingDesk")!
        }
    }
    
    var cost: Float {
        switch self {
        case .cube: return 1000.0
        case .seatingDesk: return 1100.0
        }
    }
    
    var sizePercentage: CGSize {
        switch self {
        case .cube: return CGSize(width: 0.04, height: 0.04)
        case .seatingDesk: return CGSize(width: 0.12, height: 0.14)
        }
    }
    
    var isCollaborative: Bool {
        switch self {
        case .cube: return false
        case .seatingDesk: return true
        }
    }
}
