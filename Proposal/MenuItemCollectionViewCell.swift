//
//  MenuItemCollectionViewCell.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/6/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell, ClickableView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var menuItem: MenuItem!
    var completion: ((MenuItem) -> Void)?
    
    var selector = #selector(FloorItemTableViewCell.tapGestureDetected(gesture:))
    
    func setUp(with menuItem: MenuItem, completion: ((MenuItem) -> Void)? = nil) {
        self.menuItem = menuItem
        self.completion = completion
        
        title.text = menuItem.title
        imageView.image = menuItem.image
        
        addTapGestureRecognizer()
    }
    
    func tapGestureDetected(gesture: UITapGestureRecognizer) {
        completion?(menuItem)
    }
}
