//
//  CostsEditLabelMoney.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class CostsEditLabelMoney: UILabel {

    override init(frame: CGRect) {
        super.init(frame:frame)
        
        text = "Сумма \u{002A}"
        textAlignment = .center
        textColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
