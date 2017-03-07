//
//  FloorPlanViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 2/28/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit
import PanelKit

class FloorPlanViewController: UIViewController {

    @IBOutlet weak var contentWrapperView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var floorItemsBarButton: UIBarButtonItem!
    
    var panelViewControllers: [PanelViewController] = []
    var floorItems: [FloorItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floorItems = setFloorItems()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(removeViewController(withNotification:)), name: NotificationCenterKeys.didEndDrag, object: nil)
    }
    
    func setFloorItems() -> [FloorItem] {
        let floorItemBuilder = FloorItemBuilder(viewSize: contentView.frame)
        let floorItems = floorItemBuilder.getDefault()
        
        return floorItems
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
        
        floorItemsViewController.delegate = self
        floorItemsViewController.floorItems = floorItems
        
        floorItemsViewController.modalPresentationStyle = .popover
        floorItemsViewController.popoverPresentationController?.barButtonItem = sender
    
        present(floorItemsViewController, animated: true, completion: nil)
    }
}

extension FloorPlanViewController: FloorItemsDelegate {
    
    func didSelect(item: FloorItem) {
        createPanel(for: item)
    }
    
    func createPanel(for item: FloorItem) {
        let floorItemViewController = storyboard?.instantiateViewController(withIdentifier: "FloorItemViewControllerID") as! FloorItemViewController
        
        floorItemViewController.restorationIdentifier = "\(UUID())"
        floorItemViewController.item = item
        
        
        let floorPanelViewController = PanelViewController(with: floorItemViewController, in: self)
        
        
        panelViewControllers.append(floorPanelViewController)
        showPopover(floorPanelViewController, from: floorItemsBarButton)
    }
    
    func showPopover(_ viewController: UIViewController, from barButtonItem: UIBarButtonItem) {
        
        viewController.modalPresentationStyle = .popover
        viewController.popoverPresentationController?.barButtonItem = barButtonItem
        
        present(viewController, animated: false, completion: nil)
    }
}

extension FloorPlanViewController: PanelManager {
    
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


