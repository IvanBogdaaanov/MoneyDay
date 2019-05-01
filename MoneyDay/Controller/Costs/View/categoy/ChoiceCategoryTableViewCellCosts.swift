//
//  ChoiceCategoryTableViewCellCosts.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class ChoiceCategoryTableViewCellCosts: UITableViewCell {

    let labelCategory = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        labelCategory.textAlignment = .center
        labelCategory.text = "test"
        
        labelCategory.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelCategory)
        
        addConstraints([
            
            labelCategory.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            labelCategory.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addText (_ object: ListCategoryCosts ) {
        labelCategory.text = object.Category
    }

}
