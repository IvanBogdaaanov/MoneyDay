//
//  IncomeEditeCategoryTextField.swift
//  MoneyDay
//
//  Created by Иван on 29.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class IncomeEditeCategoryTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let addNewCategoryBtn = UIButton()
    let pickerCategory = UIPickerView()
    var Category = ["Зарплата","Накопления","Долг"]
    let imageBtn = UIImage(named: "addCategory.png")?.withRenderingMode(.alwaysTemplate)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        text = Category[0]
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 15
        textAlignment = .center
        placeholder = "Выберите категорию"
        
        addNewCategoryBtn.tintColor = .gray
        addNewCategoryBtn.translatesAutoresizingMaskIntoConstraints = false
        addNewCategoryBtn.setImage(imageBtn, for: .normal)
            
        inputView = pickerCategory
        pickerCategory.delegate = self
        pickerCategory.dataSource = self
        
        addSubview(addNewCategoryBtn)
        
        addConstraints([
            
            addNewCategoryBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            addNewCategoryBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            addNewCategoryBtn.widthAnchor.constraint(equalToConstant: 30),
            addNewCategoryBtn.heightAnchor.constraint(equalToConstant: 30)
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = Category[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category[row]
    }
    
}
