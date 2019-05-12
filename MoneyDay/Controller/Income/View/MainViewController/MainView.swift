//
//  MainView.swift
//  MoneyDay
//
//  Created by Иван on 22.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class MainView: UIView {
    let courseDollar = UILabel()
    let btnIncome = UIButton()
    let btnCosts = UIButton()
    let btnDiagrams = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        courseDollar.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        courseDollar.textColor = .white
        courseDollar.font = UIFont.boldSystemFont(ofSize: 20)
        courseDollar.translatesAutoresizingMaskIntoConstraints = false
        courseDollar.text = ""
        courseDollar.textAlignment = .center
        
        backgroundColor = UIColor.white.withAlphaComponent(0.25)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
        layer.cornerRadius = 30
        clipsToBounds = true
        
        btnCosts.translatesAutoresizingMaskIntoConstraints = false
        btnCosts.setTitle("Расходы", for: .normal)
        btnCosts.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        btnDiagrams.translatesAutoresizingMaskIntoConstraints = false
        btnDiagrams.setTitle("Диграммы", for: .normal)
        btnDiagrams.backgroundColor = UIColor.gray.withAlphaComponent(0.5)

        btnIncome.translatesAutoresizingMaskIntoConstraints = false
        btnIncome.setTitle("Доходы", for: .normal)
        btnIncome.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        addSubview(courseDollar)
        addSubview(btnIncome)
        addSubview(btnCosts)
        addSubview(btnDiagrams)
        
        addConstraints([
            
            courseDollar.leftAnchor.constraint(equalTo: leftAnchor),
            courseDollar.widthAnchor.constraint(equalTo: widthAnchor),
            courseDollar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            btnIncome.leftAnchor.constraint(equalTo: leftAnchor),
            btnIncome.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            btnIncome.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            btnIncome.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4),
            
            btnCosts.leftAnchor.constraint(equalTo: leftAnchor),
            btnCosts.topAnchor.constraint(equalTo: btnIncome.bottomAnchor, constant: 10),
            btnCosts.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            btnCosts.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4),
            
            btnDiagrams.leftAnchor.constraint(equalTo: leftAnchor),
            btnDiagrams.topAnchor.constraint(equalTo: btnCosts.bottomAnchor, constant: 10),
            btnDiagrams.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            btnDiagrams.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4)
            
            ])
        
    }
    
    func updateCourse(value: Double) {
        courseDollar.text = "Курс доллара: \(value)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
