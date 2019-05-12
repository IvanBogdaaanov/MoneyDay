//
//  CommentBtnCosts.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class CommentBtnCosts: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 30
//        layer.shadowRadius = 4
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOpacity = 0.5
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("Изменить", for: .normal)
        backgroundColor = UIColor.one
        tintColor = .white
        layer.cornerRadius = 10
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
