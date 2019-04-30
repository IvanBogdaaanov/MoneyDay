//
//  IncomeTableViewCell.swift
//  MoneyDay
//
//  Created by Иван on 21.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class IncomeTableViewCell: UITableViewCell {
    
    let labelCategory = UILabel()
    let labelMoney = UILabel()
    let labelDateAndTime = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        labelMoney.textColor = .black
        labelDateAndTime.textColor = UIColor.gray
        
        labelMoney.font = UIFont(name: "HelveticaNeue", size: 18)
        labelDateAndTime.font = UIFont(name: "HelveticaNeue", size: 12)

        labelMoney.text = ""
        labelDateAndTime.text = ""
        labelCategory.text = ""
        
        addSubview(labelCategory)
        addSubview(labelMoney)
        addSubview(labelDateAndTime)
        
        labelCategory.translatesAutoresizingMaskIntoConstraints = false
        labelCategory.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        labelCategory.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        labelDateAndTime.translatesAutoresizingMaskIntoConstraints = false
        labelDateAndTime.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        labelDateAndTime.topAnchor.constraint(equalTo: labelMoney.bottomAnchor, constant: 4).isActive = true
        
        labelMoney.translatesAutoresizingMaskIntoConstraints = false
        labelMoney.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        labelMoney.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addText (objectList: OptionListObject) {
       let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy HH:mm"
        
        self.labelCategory.text = objectList.Category
        self.labelDateAndTime.text = formater.string(from: objectList.DateAndTime)
        self.labelMoney.text = "\(objectList.MoneyEdit) \u{20BD}"
        
    }
    
}
