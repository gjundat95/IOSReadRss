//
//  MenuLefViewController.swift
//  ReadRss
//
//  Created by Tinh Ngo on 9/26/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import Foundation
import UIKit

protocol MenuDelegate: class {
    func actionMenu(category: Category) -> Void
}

class MenuLefViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewMenuLef: UITableView!
    
    weak var delegate : MenuDelegate?
    
    func selectRow( category: Category){
        delegate?.actionMenu(category: category)
    }
    
    let cellIndentifier = "cells"
    let rowTable = CategoryModel.getCategoryVnReview().count
    
    override func viewDidLoad() {
        self.tableViewMenuLef.delegate = self
        self.tableViewMenuLef.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let temp = CategoryModel.getCategoryVnReview().get(index: indexPath.row){
            selectRow(category: temp)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMenuLef.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! MenuLefTableViewCell
        cell.name.text = CategoryModel.getCategoryVnReview()[indexPath.row].name
        return cell
    }
    
}

extension Array {
    
    // Safely lookup an index that might be out of bounds,
    // returning nil if it does not exist
    func get(index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}
