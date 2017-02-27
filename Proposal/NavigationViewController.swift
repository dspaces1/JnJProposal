//
//  NavigationViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 2/25/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        interactivePopGestureRecognizer?.delegate = self
    }
}

extension NavigationViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // Prevents swipe back bug when only 1 view controller is on the stack
        //
        return viewControllers.count > 1
    }
}
