//
//  IncomeEditButtonAdd.swift
//  MoneyDay
//
//  Created by Иван on 19.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class IncomeEditButtonAdd: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named: "gl.png")?.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = .two
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
