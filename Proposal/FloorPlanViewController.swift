//
//  FloorPlanViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 2/28/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit
import PanelKit

class FloorPlanViewController: UIViewController, PanelManager {

    @IBOutlet weak var contentWrapperView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var panelViewControllers: [PanelViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(removeViewController(withNotification:)), name: NotificationCenterKeys.didEndDrag, object: nil)
    }
    
    func removeViewController(withNotification notification: NSNotification) {
        guard let viewControllerID = notification.object as? UUID else { return }
        
        for viewController in panelViewControllers {
            if viewController.id == viewControllerID {
                close(viewController)
            }
        }
    }
    
    @IBAction func presentFloorItems(_ sender: UIBarButtonItem) {
        let floorItemsViewController = storyboard?.instantiateViewController(withIdentifier: "FloorItemsViewController") as! FloorItemsViewController
        
        floorItemsViewController.modalPresentationStyle = .popover
        floorItemsViewController.popoverPresentationController?.barButtonItem = sender
    
        present(floorItemsViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func addCubeViewController(_ sender: UIBarButtonItem) {
        
        let cubeViewController = storyboard?.instantiateViewController(withIdentifier: "CubeViewControllerID") as! CubeViewController
        
        cubeViewController.restorationIdentifier = "\(UUID())"
        
        let cubePanelViewController = PanelViewController(with: cubeViewController, in: self)
        
        panelViewControllers.append(cubePanelViewController)
        
        
        showPopover(cubePanelViewController, from: sender)
    }
    
    func showPopover(_ vc: UIViewController, from barButtonItem: UIBarButtonItem) {
        
        vc.modalPresentationStyle = .popover
        vc.popoverPresentationController?.barButtonItem = barButtonItem
        
        present(vc, animated: false, completion: nil)
        
    }
    
    // The view in which the panels may be dragged around
    var panelContentWrapperView: UIView {
        return contentWrapperView
    }
    
    // The content view, which will be moved/resized when panels pin
    var panelContentView: UIView {
        return contentView
    }
    
    // An array of PanelViewController objects
    var panels: [PanelViewController] {
        return panelViewControllers
    }
}
