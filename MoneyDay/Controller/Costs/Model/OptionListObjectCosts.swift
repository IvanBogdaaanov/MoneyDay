//
//  OptionListObjectCosts.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class OptionListObjectCosts: Object {
    
    @objc dynamic var DateAndTime = Date()
    @objc dynamic var MoneyEdit = Int()
    @objc dynamic var totalMoney = Double()
    @objc dynamic var Comment = String()
    @objc dynamic var Category = String()
    
    @objc dynamic var day = Int()
    @objc dynamic var month = Int()
    @objc dynamic var year = Int()
    
    convenience init(date: Date, money: Int, totalScore: Double, comment: String, category: String) {
        self.init()
        
        self.Category = category
        self.Comment = comment
        self.DateAndTime = date
        self.MoneyEdit = money
        self.totalMoney = totalScore
        
    }
}
