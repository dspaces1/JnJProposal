//
//  FloorItemTableViewCell.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/5/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class FloorItemTableViewCell: UITableViewCell, ClickableView {

    @IBOutlet weak var itemImageView: UIImageView!
    
    var completion: ((FloorItem) -> Void)?
    var item: FloorItem!
    
    var selector = #selector(FloorItemTableViewCell.tapGestureDetected(gesture:))
    
    func setUp(with item: FloorItem, completion: ((FloorItem) -> Void)? = nil) {
        
        self.item = item
        self.completion = completion
        itemImageView.image = item.image
        addTapGestureRecognizer()
    }
    
    func tapGestureDetected(gesture: UITapGestureRecognizer) {
        completion?(item)
    }
}
