//
//  MainBalanceView.swift
//  MoneyDay
//
//  Created by Иван on 25.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class MainBalanceView: UIView {
    
    let labelMoney = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
        labelMoney.text = "Баланс: 0 \u{20BD}"
        labelMoney.translatesAutoresizingMaskIntoConstraints = false
        labelMoney.textColor = .white
        
        layer.cornerRadius = 15
        
        addSubview(labelMoney)

        addConstraints([
            
            labelMoney.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelMoney.centerXAnchor.constraint(equalTo: centerXAnchor)
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
