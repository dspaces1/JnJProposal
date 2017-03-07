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
        var floorItems: [FloorItem] = []
        
        let desk = ItemDetails.seatingDesk
        let deskWidth = desk.sizePercentage.width * viewSize.width
        let deskHeight = desk.sizePercentage.height * viewSize.height
        
        let deskItem = FloorItem(title: desk.title, image: desk.image, cost: desk.cost, isCollaborative: desk.isCollaborative, width: deskWidth, height: deskHeight)
        floorItems.append(deskItem)
        
        let cubes = ItemDetails.cubeRow
        let cubesWidth = cubes.sizePercentage.width * viewSize.width
        let cubesHeight = cubes.sizePercentage.height * viewSize.height
        
        let cubesItem = FloorItem(title: cubes.title, image: cubes.image, cost: cubes.cost, isCollaborative: cubes.isCollaborative, width: cubesWidth, height: cubesHeight)
        floorItems.append(cubesItem)
        
        let wall = ItemDetails.wall
        let wallWidth = wall.sizePercentage.width * viewSize.width
        let wallHeight = wall.sizePercentage.height * viewSize.height
        
        let wallItem = FloorItem(title: wall.title, image: wall.image, cost: wall.cost, isCollaborative: wall.isCollaborative, width: wallWidth, height: wallHeight)
        floorItems.append(wallItem)
        
        return floorItems
    }
}

enum ItemDetails {
    case cubeRow
    case seatingDesk
    case wall
    
    
    var title: String {
        switch self {
        case .cubeRow: return "Cube"
        case .seatingDesk: return "Desk"
        case .wall: return "Wall"
        }
    }
    
    var image: UIImage {
        switch self {
        case .cubeRow: return UIImage(named: "CubeRow")!
        case .seatingDesk: return UIImage(named: "SeatingDesk")!
        case .wall: return UIImage(named: "wall")!
        }
    }
    
    var cost: Float {
        switch self {
        case .cubeRow: return 1000.0
        case .seatingDesk: return 1100.0
        case .wall: return 500.0
        }
    }
    
    var sizePercentage: CGSize {
        switch self {
        case .cubeRow: return CGSize(width: 0.24, height: 0.8)
        case .seatingDesk: return CGSize(width: 0.12, height: 0.14)
        case .wall: return CGSize(width: 0.12, height: 0.8)
        }
    }
    
    var isCollaborative: Bool {
        switch self {
        case .cubeRow: return false
        case .seatingDesk: return true
        case .wall: return false
        }
    }
}
