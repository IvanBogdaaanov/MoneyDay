//
//  RealmMethods.swift
//  MoneyDay
//
//  Created by Иван on 20.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMethods {
    
     let realm = try! Realm()
    
    func getList() -> [OptionListObject] {
        
        let objects = realm.objects(OptionListObject.self)
        
        return Array(objects)
    }
    
    func getCategory () -> [ListCategoryIncome] {
        
        let objects = realm.objects(ListCategoryIncome.self)
        
        return Array(objects)
        
    }
    
    func addInRealmCategory (_ option: ListCategoryIncome) {
        
        try! realm.write {
            
            realm.add(option)
            
        }
        
    }
    
    func addInRealm(_ option: OptionListObject) {
        
        try! realm.write {
            
            realm.add(option)
            
        }
    }
    
    func updateComment (index: Int, text: String?) {
        
        let objects = realm.objects(OptionListObject.self)
        
        try! realm.write {
            objects[objects.endIndex - 1 - index].Comment = text!
        }
    }
    
    
    func deleteOption(object: Object) {
        
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func filterDate (min: Date, max: Date) -> [OptionListObject] {
        
        var object = realm.objects(OptionListObject.self)
        
        let component = Calendar.current.dateComponents([.year ,.month , .day, .timeZone, .hour , .minute], from: max)
        var dateComponents = DateComponents()
        dateComponents.year = component.year
        dateComponents.month = component.month
        dateComponents.timeZone = component.timeZone
        dateComponents.hour = component.hour
        dateComponents.minute = component.minute
        dateComponents.day = component.day! + 1
        
        let userCalendar = Calendar.current
        let maxNew = userCalendar.date(from: dateComponents)
        
        object = object.filter("DateAndTime >= %@ ",min)

        object = object.filter("DateAndTime <= %@ ",maxNew!)

        
        return Array(object)
        
    }
    
}
