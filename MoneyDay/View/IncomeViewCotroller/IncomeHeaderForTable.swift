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
        super.init(frame:frame)
        
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
            labelTotal.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            labelTotal.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4),

            btnReturn.leftAnchor.constraint(equalTo: backBtn.rightAnchor, constant: 10),
            btnReturn.rightAnchor.constraint(equalTo: btnFilter.leftAnchor),
            btnReturn.topAnchor.constraint(equalTo: minDateTextField.bottomAnchor, constant: 10),
            btnReturn.heightAnchor.constraint(equalTo: minDateTextField.heightAnchor, multiplier: 1.5),

            
            btnFilter.rightAnchor.constraint(equalTo: addBtn.leftAnchor, constant: -10),
            btnFilter.leftAnchor.constraint(equalTo: btnReturn.rightAnchor),
            btnFilter.topAnchor.constraint(equalTo: maxDateTextField.bottomAnchor, constant: 10),
            btnFilter.heightAnchor.constraint(equalTo: maxDateTextField.heightAnchor, multiplier: 1.5),
            btnFilter.widthAnchor.constraint(equalTo: maxDateTextField.widthAnchor, multiplier: 1.125),
            
            minDateTextField.leftAnchor.constraint(equalTo: backBtn.rightAnchor, constant: 10),
            minDateTextField.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            minDateTextField.heightAnchor.constraint(equalTo: backBtn.heightAnchor, multiplier: 1),
            minDateTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            
            maxDateTextField.rightAnchor.constraint(equalTo: addBtn.leftAnchor, constant: -10),
            maxDateTextField.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            maxDateTextField.heightAnchor.constraint(equalTo: addBtn.heightAnchor, multiplier: 1),
            maxDateTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            
            addBtn.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            addBtn.heightAnchor.constraint(equalToConstant: 25),
            addBtn.widthAnchor.constraint(equalToConstant: 25),
            addBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            backBtn.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            backBtn.heightAnchor.constraint(equalToConstant: 25),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            backBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
            
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
   
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if minDateTextField.isFirstResponder {
            DispatchQueue.main.async(execute: {
                (sender as? UIMenuController)?.setMenuVisible(false, animated: false)
            })
            return false
        }
        if maxDateTextField.isFirstResponder {
            DispatchQueue.main.async(execute: {
                (sender as? UIMenuController)?.setMenuVisible(false, animated: false)
            })
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
}
