//
//  CubeViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/1/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit
import PanelKit

class CubeViewController: PanelContentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cubes"
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        popPanel(UIBarButtonItem())
    }

    
    override var preferredPanelContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
