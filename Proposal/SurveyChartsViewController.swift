//
//  SurveyChartsViewController.swift
//  Proposal
//
//  Created by Ryan Campanella on 2/28/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class SurveyChartsViewController: UIViewController {
    
    @IBOutlet weak var graphCollectionView: UICollectionView!
    
    var flowLayout: UICollectionViewFlowLayout {
        return graphCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNibs()
        setUpGraphCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpNibs(){
        let graphCollectionViewCellNib = UINib(nibName: GraphCollectionViewCell.className, bundle: nil)
        graphCollectionView.register(graphCollectionViewCellNib, forCellWithReuseIdentifier: GraphCollectionViewCell.className)
    }
    
    func setUpGraphCollectionView(){
        graphCollectionView.dataSource = self
        
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
    }

}

extension SurveyChartsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GraphCollectionViewCell.className, for: indexPath) as! GraphCollectionViewCell
        cell.setUp(surveyData: SurveyData.getGraphData(surveyNumber: indexPath.item)!)
        
        return cell
    }

}
