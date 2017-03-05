//
//  ClickableView+UIView.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/5/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

protocol ClickableView {
    var selector: Selector { get }
    func addTapGestureRecognizer()
}

extension ClickableView where Self: UIView {
    func addTapGestureRecognizer() {
        let gesture = UITapGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(gesture)
    }
}
