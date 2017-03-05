//
//  FloorItemsViewController.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/3/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

protocol FloorItemsDelegate: class {
    func didSelect(item: FloorItem)
}

class FloorItemsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var floorItems: [FloorItem] = []
    
    weak var delegate: FloorItemsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.dataSource = self
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension FloorItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return floorItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FloorItemTableViewCell.className, for: indexPath) as! FloorItemTableViewCell
        
        let item = floorItems[indexPath.row]
        cell.setUp(with: item) { item in
            self.dismiss(animated: false, completion: nil)
            self.delegate?.didSelect(item: item)
            
        }
        
        return cell
    }
    
}
