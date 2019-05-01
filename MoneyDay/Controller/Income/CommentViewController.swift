//
//  CommentViewController.swift
//  MoneyDay
//
//  Created by Иван on 24.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class CommentViewController: UIViewController {
    
    let labelComment = labelCommentChange()
    let textForTextViewComment: String
    let index: Int
    
    init (textForTextViewComment: String, index: Int) {
        
        self.textForTextViewComment = textForTextViewComment
        self.index = index
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textViewComment = CommentTextView()
    let btnChangeComment = CommentButtonChange()
    let realmMethods = RealmMethods()
    var listIncome = [OptionListObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listIncome = realmMethods.getList()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagePNG = UIImage(named: "backgr.png")!
        view.backgroundColor = UIColor(patternImage: imagePNG)
        
        textViewComment.text = textForTextViewComment
        
        btnChangeComment.addTarget(self, action: #selector(btnTap(_:)), for: .touchUpInside)
        
        view.addSubview(labelComment)
        view.addSubview(textViewComment)
        view.addSubview(btnChangeComment)
        
        view.addConstraints([
            
            labelComment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            labelComment.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            labelComment.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            textViewComment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            textViewComment.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            textViewComment.topAnchor.constraint(equalTo: labelComment.bottomAnchor, constant: 15),
            textViewComment.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2),
            
            btnChangeComment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnChangeComment.topAnchor.constraint(equalTo: textViewComment.bottomAnchor, constant: 25),
            btnChangeComment.heightAnchor.constraint(equalTo: textViewComment.widthAnchor, multiplier: 1/7),
            btnChangeComment.widthAnchor.constraint(equalTo: textViewComment.widthAnchor, multiplier: 1/3)
            
            ])
        
    }
    
    @objc func btnTap (_ sender: UIButton) {
        realmMethods.updateComment(index: index, text: textViewComment.text)
        navigationController?.popViewController(animated: true)
    }
}
