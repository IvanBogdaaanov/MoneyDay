//
//  setBackground.swift
//  MoneyDay
//
//  Created by Иван on 12.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBackGround (imageName: String) {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: imageName)
        
        imageViewBackground.contentMode = .scaleToFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
}
