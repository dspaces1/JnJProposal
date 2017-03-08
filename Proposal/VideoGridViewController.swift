//
//  VideoGridViewController.swift
//  Proposal
//
//  Created by Stephen Hayes on 3/2/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class VideoGridViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var profiles: [Profile] = []
    var selectedCellFrame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileBuilder = ProfileBuilder()
        profiles = profileBuilder.getAll()
        
        collectionView.register(UINib(nibName: VideoGridCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: VideoGridCollectionViewCell.className)
        collectionView.backgroundView = UIView()
        collectionView.backgroundView?.isUserInteractionEnabled = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapInBackgroundView))
        collectionView.backgroundView?.gestureRecognizers = [tapRecognizer]
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tapInBackgroundView() {
        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems, selectedIndexPaths.count > 0 {
            _ = selectedIndexPaths.map { closeCell(at: $0) }
        }
    }
}

extension VideoGridViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoGridCollectionViewCell.className, for: indexPath) as! VideoGridCollectionViewCell
        
        let profile = profiles[indexPath.row]
        cell.setUp(with: profile)
        
        return cell
    }
}

extension VideoGridViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let cell = collectionView.cellForItem(at: indexPath) as! VideoGridCollectionViewCell
        
        if cell.isSelected {
            closeCell(at: indexPath)
            return false
        } else if let selectedIndexPaths = collectionView.indexPathsForSelectedItems, selectedIndexPaths.count > 0 {
            _ = selectedIndexPaths.map { closeCell(at: $0) }
            return false
        } else {
            return true
        }
    }
    
    func closeCell(at indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! VideoGridCollectionViewCell
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        UIView.transition(with: cell, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            cell.frame = self.selectedCellFrame
            cell.videoView.alpha = 0.0
            self.collectionView.isUserInteractionEnabled = false
        }, completion: { completed in
            cell.videoView.isHidden = true
            cell.playerViewController.player?.pause()
            self.selectedCellFrame = CGRect.zero
            self.collectionView.isUserInteractionEnabled = true
        })
    }
    
    func openCell(at indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! VideoGridCollectionViewCell
        
        cell.videoView.isHidden = false
        UIView.transition(with: cell, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            self.selectedCellFrame = cell.frame
            cell.superview?.bringSubview(toFront: cell)
            cell.frame = self.modalFrame()
            cell.videoView.alpha = 1.0
            cell.loadVideo()
            self.collectionView.isUserInteractionEnabled = false
        }, completion: { completed in
            cell.playerViewController.player?.play()
            self.collectionView.isUserInteractionEnabled = true
        })
    }
    
    func modalFrame() -> CGRect {
        let width = min(view.frame.size.width - 60.0, 600.0)
        let height = min(view.frame.size.height - 60.0, 600.0)
        let navBarHeight: CGFloat = navigationController?.navigationBar.frame.height ?? 0.0
        
        return CGRect(x: view.center.x - (width / 2), y: view.center.y - navBarHeight - (height / 2), width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openCell(at: indexPath)
    }
}

extension VideoGridViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaceBetweenItems: CGFloat = 10.0
        
        let itemWidth = floor((collectionView.frame.size.width - (spaceBetweenItems * 2)) / 3)
        let itemHeight = floor((collectionView.frame.size.height - (spaceBetweenItems * 2)) / 3)
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
