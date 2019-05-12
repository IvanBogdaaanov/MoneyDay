//
//  IncomeEditViewController.swift
//  MoneyDay
//
//  Created by Иван on 18.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class IncomeEditViewController: UIViewController {
    
    let textFieldCategory = IncomeEditeCategoryTextField()
    let labelCategory = IncomeEditLabelCategory()
    let btnBack = IncomeEditBackBtn()
    let moneyTextField = IncomeEditTextFieldMoney()
    let dateTextField = IncomeEditDateTextField()
    let labelDate = IncomeEditLabelDate()
    let labelMoney = IncomeEditLabelMoney()
    let labelComment = IncomeEditLabelComment()
    let textViewComment = IncomeEditTextView()
    let buttonAdd = IncomeEditButtonAdd()
    
    var categorys = [ListCategoryIncome]()
    
    let realmMethods = RealmMethods()
    
    let imageCategoryView = UIImageView(image: UIImage(named: "salaryCategory.png"))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        categorys = realmMethods.getCategory()
        
        textFieldCategory.Category = ["Зарплата","Накопления","Другое"]
        
        if !(categorys.isEmpty) {
            for index in 0..<categorys.endIndex {
                if !(textFieldCategory.Category.contains(categorys[index].Category)) {
                    
                    textFieldCategory.Category.append(categorys[index].Category)
                    
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        textFieldCategory.Category.removeAll()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackGround(imageName: "backgr.png")

        let tapImage = UITapGestureRecognizer(target: self, action: #selector(tapCategory(_:)))
        imageCategoryView.addGestureRecognizer(tapImage)
        imageCategoryView.isUserInteractionEnabled = true
        
        let tapGestureDate = UITapGestureRecognizer(target: self, action: #selector(tapGestureDate(gestureRecognizer:)))
        view.addGestureRecognizer(tapGestureDate)
        
        buttonAdd.addTarget(self, action: #selector(tapButtonAdd(_:)), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(backBtnIncome(_:)), for: .touchUpInside)
        textFieldCategory.addNewCategoryBtn.addTarget(self, action: #selector(tapAddCategory(_:)), for: .touchUpInside)

        
        view.addSubview(btnBack)
        
        btnBack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        btnBack.widthAnchor.constraint(equalToConstant: 35).isActive = true
        btnBack.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(labelDate)

        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        labelDate.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        labelDate.heightAnchor.constraint(equalToConstant: 15).isActive = true

        view.addSubview(dateTextField)

        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        dateTextField.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 10).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dateTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true

        view.addSubview(labelMoney)

        labelMoney.translatesAutoresizingMaskIntoConstraints = false
        labelMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        labelMoney.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20).isActive = true
        labelMoney.heightAnchor.constraint(equalToConstant: 15).isActive = true

        view.addSubview(moneyTextField)

        moneyTextField.translatesAutoresizingMaskIntoConstraints = false
        moneyTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        moneyTextField.topAnchor.constraint(equalTo: labelMoney.bottomAnchor, constant: 10).isActive = true
        moneyTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        moneyTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true

        view.addSubview(labelComment)

        labelComment.translatesAutoresizingMaskIntoConstraints = false
        labelComment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        labelComment.topAnchor.constraint(equalTo: moneyTextField.bottomAnchor, constant: 20).isActive = true
        labelComment.heightAnchor.constraint(equalToConstant: 15).isActive = true

        view.addSubview(textViewComment)

        textViewComment.translatesAutoresizingMaskIntoConstraints = false
        textViewComment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        textViewComment.topAnchor.constraint(equalTo: labelComment.bottomAnchor, constant: 10).isActive = true
        textViewComment.heightAnchor.constraint(equalToConstant: 100).isActive = true
        textViewComment.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        view.addSubview(labelCategory)
        
        labelCategory.translatesAutoresizingMaskIntoConstraints = false
        labelCategory.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        labelCategory.topAnchor.constraint(equalTo: textViewComment.bottomAnchor, constant: 20).isActive = true
        labelCategory.heightAnchor.constraint(equalToConstant: 15).isActive = true

        view.addSubview(buttonAdd)

        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        buttonAdd.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true

        
        view.addSubview(textFieldCategory)
        
        textFieldCategory.translatesAutoresizingMaskIntoConstraints = false
        textFieldCategory.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        textFieldCategory.topAnchor.constraint(equalTo: labelCategory.bottomAnchor, constant: 10).isActive = true
        textFieldCategory.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textFieldCategory.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true

    }
    @objc func tapAddCategory(_ sender: UIButton) {
        let vc = ChoiceCategoryController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func tapCategory (_ sender: UITapGestureRecognizer) {
        
        let vc = ChoiceCategoryController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func backBtnIncome (_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapGestureDate (gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func tapButtonAdd (_ sender: UIButton) {
        
        if !(moneyTextField.text?.isEmpty)! {
            
            let option = OptionListObject(date: dateTextField.picker.date, money: Int(moneyTextField.text!)!, totalScore: Double(moneyTextField.text!)!, comment: textViewComment.text, category: textFieldCategory.text!)
            
            realmMethods.addInRealm(option)
            
            navigationController?.popViewController(animated: true)
            
        } else {
            
            print("текстовое поле пустое")
            
        }
    }    
}

