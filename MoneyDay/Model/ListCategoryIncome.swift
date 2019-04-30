//
//  ListCategoryIncome.swift
//  MoneyDay
//
//  Created by Иван on 29.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class ListCategoryIncome: Object {
    
    @objc dynamic var Category = String()
    
    convenience init(categoryAdd:String) {
        
        self.init()
        
        self.Category = categoryAdd
        
    }
    
}
