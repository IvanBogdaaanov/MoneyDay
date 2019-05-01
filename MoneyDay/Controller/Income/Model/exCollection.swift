//
//  exCollection.swift
//  MoneyDay
//
//  Created by Иван on 20.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
