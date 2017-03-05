//
//  LoadViews+UIScrollView.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/5/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    //Load an array of views into a scrollView
    //
    func loadViewsIntoScrollView(views: [UIView]) {
        var horizontalConstraintFormatString = "H:|-0-"
        var horizontalConstraintViewDictionary = [String: AnyObject]()
        
        for (index, view) in views.enumerated() {
            //Turn off translatesAutoresizingMaskIntoConstraints since we are adding
            //constraints manually/through code
            //
            view.translatesAutoresizingMaskIntoConstraints = false
            
            //Add the views into the scroll view
            //
            addSubview(view)
            
            //Pin the view to the top and bottom of the scroll view
            //
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v]-0-|", options: [], metrics: nil, views: ["v": view])
            addConstraints(verticalConstraints)
            
            //Set the height of each view to be the same as the scrollView's height
            //
            let equalHeightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[sv(==v)]", options: [], metrics: nil, views: ["v": view, "sv": self])
            addConstraints(equalHeightConstraints)
            
            //Set the width of each view to be the same as the scrollView's width
            //
            let equalWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[sv(==v)]", options: [], metrics: nil, views: ["v": view, "sv": self])
            addConstraints(equalWidthConstraints)
            
            //Setup each view to be handled for the horizontal view constraint
            //
            let viewName = "v\(index)"
            horizontalConstraintFormatString += "[\(viewName)]-0-"
            horizontalConstraintViewDictionary[viewName] = view
        }
        horizontalConstraintFormatString += "|"
        
        //Add the final horizontal constraint, linking all the views together
        //Should end up looking something like: "H:|-0-[v1]-0-[v2]-0-[v3]-0-|"
        //
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintFormatString, options: [], metrics: nil, views: horizontalConstraintViewDictionary)
        addConstraints(horizontalConstraints)
    }
}
