//
//  DiagramIncomeLable.swift
//  MoneyDay
//
//  Created by Иван on 02.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class DiagramIncomeLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        text = "Диаграмма с доходами"
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
