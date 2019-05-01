//
//  IncomeEditLabelCategory.swift
//  MoneyDay
//
//  Created by Иван on 25.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class IncomeEditLabelCategory: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        text = "Выберите категорию"
        textAlignment = .center
        textColor = .gray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
