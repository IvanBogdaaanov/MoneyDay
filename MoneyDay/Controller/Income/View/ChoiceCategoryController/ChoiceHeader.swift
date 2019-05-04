//
//  ChoiceHeader.swift
//  MoneyDay
//
//  Created by Иван on 29.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class ChoiceHeader: UIView, UITextFieldDelegate {

    let textFieldCategory = UITextField()
    let btnAddChoice = UIButton()
    let btnBack = UIButton()
    let imgAdd = UIImage(named: "addPlus.png")?.withRenderingMode(.alwaysTemplate)
    let imgBACK = UIImage(named: "push3.png")?.withRenderingMode(.alwaysTemplate)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textFieldCategory.delegate = self
        textFieldCategory.textAlignment = .center
        textFieldCategory.placeholder = "Введите категорию"
        textFieldCategory.translatesAutoresizingMaskIntoConstraints = false
        
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.setImage(imgBACK, for: .normal)
        btnBack.tintColor = .gray
        
        btnAddChoice.translatesAutoresizingMaskIntoConstraints = false
        btnAddChoice.setImage(imgAdd, for: .normal)
        btnAddChoice.tintColor = .gray
        
        addSubview(btnAddChoice)
        addSubview(btnBack)
        addSubview(textFieldCategory)
        
        addConstraints([
            
            textFieldCategory.centerYAnchor.constraint(equalTo: centerYAnchor),
            textFieldCategory.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            btnAddChoice.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnAddChoice.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            btnBack.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnBack.leftAnchor.constraint(equalTo: leftAnchor, constant: 15)
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        let newLength = currentCharacterCount + string.count
        return newLength <= 20
        
    }
    
}
