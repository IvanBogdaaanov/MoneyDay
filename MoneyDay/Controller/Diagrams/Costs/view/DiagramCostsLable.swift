//
//  DiagramCostsLable.swift
//  MoneyDay
//
//  Created by Иван on 02.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class DiagramCostsLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        text = "Диаграмма с расходами"
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
