//
//  IncomeEditBackBtn.swift
//  MoneyDay
//
//  Created by Иван on 25.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class IncomeEditBackBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(named: "push3.png")
        setImage(image, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
