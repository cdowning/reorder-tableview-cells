//
//  Category.swift
//  DragAndDrop
//
//  Created by Caitlin on 11/2/18.
//  Copyright © 2018 Caitlin. All rights reserved.
//

import Foundation
import UIKit

struct Category {
    
    // MARK: Properties
    let name: String
    let amount: String
    
    static let NameKey = "NameKey"
    static let AmountKey = "AmountKey"
    
    init(dictionary: [String : String]) {
        self.name = dictionary[Category.NameKey]!
        self.amount = dictionary[Category.AmountKey]!
    }
    
}


extension Category {
    
    // Generate an array full of all of the villains
    static var categories: [Category] {
        
        var categoryArray = [Category]()
        
        for d in Category.categoryData() {
            categoryArray.append(Category(dictionary: d))
        }
        
        return categoryArray
    }
    
    static func categoryData() -> [[String : String]] {
        return [
            [Category.NameKey : "Mortgage", Category.AmountKey : "124"],
            [Category.NameKey : "Electricity", Category.AmountKey : "100"],
            [Category.NameKey : "Water", Category.AmountKey : "80"],
            [Category.NameKey : "Cable", Category.AmountKey : "80"],
            [Category.NameKey : "Internet", Category.AmountKey : "50"],
            [Category.NameKey : "Phone", Category.AmountKey : "100"]
        ]
    }
}
