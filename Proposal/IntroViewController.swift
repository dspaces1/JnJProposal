//
//  IntroViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 2/25/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuItems: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItems = MenuItem.all()
        
        setUpCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func setUpCollectionView() {
        let menuItemNib = UINib(nibName: MenuItemCollectionViewCell.className, bundle: nil)
        collectionView.register(menuItemNib, forCellWithReuseIdentifier: MenuItemCollectionViewCell.className)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func presentSurvey() {
        let surveyChartViewController = SurveyChartsViewController(nibName: SurveyChartsViewController.className, bundle: nil)
        navigationController?.pushViewController(surveyChartViewController, animated: true)
    }
    
    func presentVideoGrid() {
        let videoGridViewController = VideoGridViewController(nibName: VideoGridViewController.className, bundle: nil)
        navigationController?.pushViewController(videoGridViewController, animated: true)
    }
    
    func playGarageVideo() {
        performSegue(withIdentifier: "Stats", sender: self)
    }
}

extension IntroViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCollectionViewCell.className, for: indexPath) as! MenuItemCollectionViewCell
        
        let menuItem = menuItems[indexPath.row]
        cell.setUp(with: menuItem) { item in
    
            switch item {
            case .theMission: self.performSegue(withIdentifier: "TheMission", sender: self)
            case .surveyResult: self.presentSurvey()
            case .howWeWork: self.playGarageVideo()
            case .ourPeople: self.presentVideoGrid()
            case .concepts: self.performSegue(withIdentifier: item.title, sender: self)
            // Special case were title has newline char
            //
            case .ourPlan: self.performSegue(withIdentifier: "Our Plan", sender: self)
            }
        }
        return cell
    }
}

extension IntroViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaceBetweenItems: CGFloat = 0.0
        
        let itemWidth = floor((collectionView.frame.size.width - (spaceBetweenItems * 2)) / 3)
        let itemHeight = floor((collectionView.frame.size.height - (spaceBetweenItems * 2)) / 2)
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
