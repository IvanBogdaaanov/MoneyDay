//
//  CommentTextView.swift
//  MoneyDay
//
//  Created by Иван on 24.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class CommentTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .black
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        layer.cornerRadius = 15
        font = UIFont.systemFont(ofSize: 20)
        textContainerInset = UIEdgeInsets(top: 9, left: 5, bottom: 5, right: 5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

