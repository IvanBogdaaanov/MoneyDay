//
//  DiagramIncomeBackBtn.swift
//  MoneyDay
//
//  Created by Иван on 02.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class DiagramIncomeBackBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(named: "push3.png")
        
        translatesAutoresizingMaskIntoConstraints = false
        setImage(image, for: .normal)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
