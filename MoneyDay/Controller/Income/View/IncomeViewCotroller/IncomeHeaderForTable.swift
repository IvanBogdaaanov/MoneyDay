//
//  IncomeHeaderForTable.swift
//  MoneyDay
//
//  Created by Иван on 23.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class IncomeHeaderForTable: UIView {

    let pickerDateMin = UIDatePicker()
    let pickerDateMax = UIDatePicker()
    let dateFormatter = DateFormatter()

    let labelTotal = UILabel()
    let btnFilter = UIButton()
    let btnReturn = UIButton()
    let minDateTextField = UITextField()
    let maxDateTextField = UITextField()
    let addBtn = IncomeAddBtn()
    let backBtn = IncomeBackBtn()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 130))
        
        
        minDateTextField.delegate = self
        maxDateTextField.delegate = self
        
        labelTotal.text = "Сумма 0 \u{20BD}"
        labelTotal.translatesAutoresizingMaskIntoConstraints = false
        labelTotal.textAlignment = .center
        labelTotal.backgroundColor = UIColor.skyColor.withAlphaComponent(0.25)
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        pickerDateMin.datePickerMode = .date
        minDateTextField.inputView = pickerDateMin
        pickerDateMin.addTarget(self, action: #selector(tapMin(dateMin:)), for: .valueChanged)
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        pickerDateMax.datePickerMode = .date
        maxDateTextField.inputView = pickerDateMax
        pickerDateMax.addTarget(self, action: #selector(tapMax(dateMax:)), for: .valueChanged)
        
        btnFilter.backgroundColor = .skyColor
        btnReturn.backgroundColor = .gray

        btnFilter.setTitle("Фильтр", for: .normal)
        btnReturn.setTitle("Вернуть", for: .normal)
        
        btnFilter.translatesAutoresizingMaskIntoConstraints = false
        btnReturn.translatesAutoresizingMaskIntoConstraints = false
        
        minDateTextField.translatesAutoresizingMaskIntoConstraints = false
        maxDateTextField.translatesAutoresizingMaskIntoConstraints = false
        
        minDateTextField.textAlignment = .center
        maxDateTextField.textAlignment = .center
        
        minDateTextField.placeholder = "От"
        maxDateTextField.placeholder = "До"
        
        minDateTextField.backgroundColor = .white
        minDateTextField.layer.cornerRadius = 10
        minDateTextField.layer.borderColor = UIColor.black.cgColor
        minDateTextField.layer.borderWidth = 0.5
        
        maxDateTextField.backgroundColor = .white
        maxDateTextField.layer.cornerRadius = 10
        maxDateTextField.layer.borderColor = UIColor.black.cgColor
        maxDateTextField.layer.borderWidth = 0.5
        
        addSubview(labelTotal)
        addSubview(btnFilter)
        addSubview(btnReturn)
        addSubview(minDateTextField)
        addSubview(maxDateTextField)
        addSubview(backBtn)
        addSubview(addBtn)
        
        addConstraints([
            
            labelTotal.topAnchor.constraint(equalTo: btnReturn.bottomAnchor, constant: 10),
            labelTotal.leftAnchor.constraint(equalTo: leftAnchor),
            labelTotal.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            labelTotal.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4),
            
            btnReturn.leftAnchor.constraint(equalTo: backBtn.rightAnchor, constant: 10),
            btnReturn.rightAnchor.constraint(equalTo: btnFilter.leftAnchor),
            btnReturn.topAnchor.constraint(equalTo: minDateTextField.bottomAnchor, constant: 10),
            btnReturn.heightAnchor.constraint(equalToConstant: 35),
            
            btnFilter.rightAnchor.constraint(equalTo: addBtn.leftAnchor, constant: -10),
            btnFilter.leftAnchor.constraint(equalTo: btnReturn.rightAnchor),
            btnFilter.topAnchor.constraint(equalTo: maxDateTextField.bottomAnchor, constant: 10),
            btnFilter.heightAnchor.constraint(equalToConstant: 35),
            btnFilter.widthAnchor.constraint(equalTo: maxDateTextField.widthAnchor, multiplier: 1.125),
            
            minDateTextField.rightAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            
            minDateTextField.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            minDateTextField.heightAnchor.constraint(equalToConstant: 35),
            minDateTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            
            maxDateTextField.leftAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            maxDateTextField.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            maxDateTextField.heightAnchor.constraint(equalToConstant: 35),
            maxDateTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            
            addBtn.centerYAnchor.constraint(equalTo: minDateTextField.centerYAnchor),
            addBtn.heightAnchor.constraint(equalToConstant: 25),
            addBtn.widthAnchor.constraint(equalToConstant: 25),
            addBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            backBtn.centerYAnchor.constraint(equalTo: minDateTextField.centerYAnchor),
            backBtn.widthAnchor.constraint(equalToConstant: 30),
            backBtn.heightAnchor.constraint(equalToConstant: 30),
            backBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 12)
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapMin (dateMin: UIDatePicker) {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        minDateTextField.text = dateFormatter.string(from: dateMin.date)
    }
    
    @objc func tapMax(dateMax: UIDatePicker) {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        maxDateTextField.text = dateFormatter.string(from: dateMax.date)
    }
    
}
extension IncomeHeaderForTable: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                
        let currentCharacterCount = textField.text?.count ?? 0
        let newLength = currentCharacterCount + string.count
        return newLength <= 10
        
    }

}
