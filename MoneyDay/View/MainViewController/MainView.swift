//
//  MainView.swift
//  MoneyDay
//
//  Created by Иван on 22.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let btnIncome = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.three.withAlphaComponent(0.7)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 30
        
        btnIncome.translatesAutoresizingMaskIntoConstraints = false
        btnIncome.setTitle("Income", for: .normal)
        
        addSubview(btnIncome)
        
        addConstraints([
            
            btnIncome.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            btnIncome.topAnchor .constraint(equalTo: topAnchor, constant: 15)
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
