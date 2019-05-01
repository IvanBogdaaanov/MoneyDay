//
//  CostsBtn.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class CostsAddBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(named: "addPlus.png")
        setImage(image, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
