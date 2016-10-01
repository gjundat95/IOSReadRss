//
//  ItemModel.swift
//  ReadRss
//
//  Created by Tinh Ngo on 9/25/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var title: String?
    var description: String?
    var link: String?
    var date: String?
    var image: String?
    
    init() {
    }
    
    init(tit: String,des: String,link: String,date: String,image: String) {
        self.title = tit
        self.description = des
        self.link = link
        self.date = date
    }

    func setTitle(tit: String){
        self.title = tit
    }
    func getTitle() -> String{
        return title!
    }
    
    
}

class ItemModel {
    var items: [Item] = []
    
    func getItems() -> [Item]{
        return items
    }
    
    func setItems(item : Item) -> Void {
        items.append(item)
    }
}

