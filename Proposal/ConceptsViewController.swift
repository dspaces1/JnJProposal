//
//  ConceptsViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/5/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class ConceptsViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        let imageNames = ["AirBnb", "FacebookCali", "GoDaddy", "Concept1", "Concept2", "Concept3"]
        pageControl.numberOfPages = imageNames.count
        var imageViews = [UIImageView]()
        
        for imageName in imageNames {
            let image = UIImage(named: imageName)
            imageViews.append(UIImageView(image: image))
        }
        
        scrollView.loadViewsIntoScrollView(views: imageViews)
    }
}

extension ConceptsViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView)  {
        let pageWidth = scrollView.frame.size.width
        let fractionalPage = scrollView.contentOffset.x / pageWidth
        let pageNumber = lround(Double(fractionalPage))
        pageControl.currentPage = pageNumber
    }
}
