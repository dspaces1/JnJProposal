//
//  FloorItemViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/5/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit
import PanelKit

class FloorItemViewController: PanelContentViewController {

    @IBOutlet weak var imageView: UIImageView!
    var item: FloorItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = item.title
        imageView.image = item.image
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        popPanel(UIBarButtonItem())
    }
    
    
    override var preferredPanelContentSize: CGSize {
        
        
        return CGSize(width: item.width, height: item.height)
    }
}

