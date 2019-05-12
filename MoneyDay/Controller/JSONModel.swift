//
//  JSONModel.swift
//  MoneyDay
//
//  Created by Иван on 06.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import Foundation
import ObjectMapper

struct Welcome: Mappable {
    
    var date, previousDate: Date?
    var previousURL: String?
    var timestamp: Date?
    var valute: [String: Valute]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        date <- map["Date"]
        previousDate <- map["PreviousDate"]
        timestamp <- map["Timestamp"]
        valute <- map["Valute"]
    }
    
}

struct Valute: Mappable {
    
    var id, numCode, charCode: String?
    var nominal: Int?
    var name: String?
    var value, previous: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["ID"]
        numCode <- map["NumCode"]
        charCode <- map["CharCode"]
        nominal <- map["Nominal"]
        name <- map["Name"]
        value <- map["Value"]
        previous <- map["Previous"]
    }
    
    
}
