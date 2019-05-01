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
    let btnCosts = UIButton()
    let btnDiagrams = UIButton()
    let btnCopy = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
        layer.cornerRadius = 30
        
        btnCosts.translatesAutoresizingMaskIntoConstraints = false
        btnCosts.setTitle("Расходы", for: .normal)
        btnCosts.backgroundColor = UIColor.skyColor.withAlphaComponent(0.5)
        btnCosts.layer.cornerRadius = 15
        
        btnDiagrams.translatesAutoresizingMaskIntoConstraints = false
        btnDiagrams.setTitle("Диграммы", for: .normal)
        btnDiagrams.backgroundColor = UIColor.skyColor.withAlphaComponent(0.5)
        btnDiagrams.layer.cornerRadius = 15
        
        btnCopy.translatesAutoresizingMaskIntoConstraints = false
        btnCopy.setTitle("Резервная копия", for: .normal)
        btnCopy.backgroundColor = UIColor.skyColor.withAlphaComponent(0.5)
        btnCopy.layer.cornerRadius = 15
        
        btnIncome.translatesAutoresizingMaskIntoConstraints = false
        btnIncome.setTitle("Доходы", for: .normal)
        btnIncome.backgroundColor = UIColor.skyColor.withAlphaComponent(0.5)
        btnIncome.layer.cornerRadius = 15
        
        addSubview(btnIncome)
        addSubview(btnCosts)
        addSubview(btnDiagrams)
        addSubview(btnCopy)
        
        addConstraints([
            
            btnIncome.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            btnIncome.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            btnIncome.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2.25),
            btnIncome.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3.5),
            
            btnCosts.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            btnCosts.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            btnCosts.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2.25),
            btnCosts.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3.5),
            
            btnDiagrams.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            btnDiagrams.topAnchor.constraint(equalTo: btnIncome.bottomAnchor, constant: 10),
            btnDiagrams.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2.25),
            btnDiagrams.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3.5),
            
            btnCopy.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            btnCopy.topAnchor.constraint(equalTo: btnCosts.bottomAnchor, constant: 10),
            btnCopy.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2.25),
            btnCopy.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3.5)
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
