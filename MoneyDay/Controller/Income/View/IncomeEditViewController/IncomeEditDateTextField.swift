//
//  DateTextField.swift
//  MoneyDay
//
//  Created by Иван on 18.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class IncomeEditDateTextField: UITextField {

    let picker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let nameImage = "clock.png"
        let images = UIImage(named: nameImage)?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: images)
        
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        text = dateFormatter.string(from: picker.date)
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 15
        textAlignment = .center
        
        picker.datePickerMode = .dateAndTime
        inputView = picker

        picker.addTarget(self, action: #selector(textFieldDate(datePicker:)), for: .valueChanged)
        
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        imageView.tintColor = UIColor.skyColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Нажатие на textField
    @objc func textFieldDate(datePicker: UIDatePicker) {
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        text = dateFormatter.string(from: datePicker.date)
    }
}
extension CostsEditDateTextField: UITextFieldDelegate {
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if isFirstResponder {
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

