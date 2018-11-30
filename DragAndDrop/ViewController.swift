//
//  ViewController.swift
//  DragAndDrop
//
//  Created by Caitlin on 11/2/18.
//  Copyright © 2018 Caitlin. All rights reserved.
//

import Foundation
import UIKit
import SwiftReorder

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allCategories = Category.categories
    
    let cellReuseIndentifier = "CategoryCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reorder.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        
        if let spacer = tableView.reorder.spacerCell(for: indexPath) {
            return spacer
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIndentifier, for: indexPath)
        let category = self.allCategories[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = category.name
        
        
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Amount: \(category.amount)"
        }
        
        return cell
    }

}



extension ViewController: TableViewReorderDelegate {
    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("reorderRowAt")
        
        let item = self.allCategories[sourceIndexPath.row]
        self.allCategories.remove(at: sourceIndexPath.row)
        self.allCategories.insert(item, at: destinationIndexPath.row)

        
        tableView.reorder.cellScale = 1.05
    }
}
