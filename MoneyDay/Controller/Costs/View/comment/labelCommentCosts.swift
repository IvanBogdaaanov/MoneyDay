//
//  labelCommentCosts.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class labelCommentCosts: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        text = "Комментарий:"
        textAlignment = .left
        textColor = .black
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
