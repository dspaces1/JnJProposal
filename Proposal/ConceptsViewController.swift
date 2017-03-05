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
        
        let image = UIImage(named: "AirBnb")!
        let imageView = UIImageView(image: image)
        
        scrollView.loadViewsIntoScrollView(views: [imageView, imageView, imageView])
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
