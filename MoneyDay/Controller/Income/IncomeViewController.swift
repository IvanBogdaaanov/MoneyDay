//
//  IncomeViewController.swift
//  MoneyDay
//
//  Created by Иван on 18.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class IncomeViewController: UITableViewController {
    
    var money: Double = 0 {
        didSet {
            views.labelTotal.text = "Сумма \(money) \u{20BD}"
        }
    }
    let alertForIncome = UIAlertController(title: "Ошибка", message: "Неверно введен формат даты", preferredStyle: .alert)
    let formatterDate = DateFormatter()
    let views = IncomeHeaderForTable()
    let id = "numberOne"
    let realmMethods = RealmMethods()
    var filterYear = [OptionListObject]()
    var listIncome = [OptionListObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listIncome = realmMethods.filterArrayTimeIncome()
        tableView.reloadData()
        updateBalance(object: listIncome)
        views.labelTotal.text = "Сумма \(money) \u{20BD}"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views.addBtn.addTarget(self, action: #selector(addTableCell(_:)), for: .touchUpInside)
        views.backBtn.addTarget(self, action: #selector(backMain(_:)), for: .touchUpInside)
        views.btnFilter.addTarget(self, action: #selector(tapBtnFilter(_:)) , for: .touchUpInside)
        views.btnReturn.addTarget(self, action: #selector(tapBackList(_:)), for: .touchUpInside)
        
        tableView.tableHeaderView = views
        
        let action = UIAlertAction(title: "Ок", style: .default) { (action) in
            
        }
        alertForIncome.addAction(action)
        
        let tapGestureDate = UITapGestureRecognizer(target: self, action: #selector(tapGestureDate(gestureRecognizer:)))
        view.addGestureRecognizer(tapGestureDate)
        
        let imagePNG = UIImage(named: "backgr.png")
        let imageView = UIImageView(image: imagePNG)
        tableView.backgroundView = imageView
        
        tableView.register(IncomeTableViewCell.self, forCellReuseIdentifier: id)
        
        tableView.allowsSelection = false
        
    }
    
    func updateBalance(object: [OptionListObject]) {
        money = 0
        for items in object {
            money += items.totalMoney
        }
    }
    
    
    @objc func tapGestureDate (gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func addTableCell(_ sender: UIButton) {
        
        let vc = IncomeEditViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func backMain(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapBtnFilter(_ sender: UIButton) {
        
        let paternRegex = "([0-9][0-9]\\.[0-9][0-9]\\.[0-9][0-9][0-9][0-9])"
        
        let rangeTextMin = NSRange(location: 0, length: (views.minDateTextField.text?.utf16.count)!)
        let regexMin = try! NSRegularExpression(pattern: paternRegex, options: [])
        
        let rangeTextMax = NSRange(location: 0, length: (views.maxDateTextField.text?.utf16.count)!)
        let regexMax = try! NSRegularExpression(pattern: paternRegex, options: [])
        
        if regexMin.firstMatch(in: views.minDateTextField.text!, options: [], range: rangeTextMin) != nil {
            if regexMax.firstMatch(in: views.minDateTextField.text!, options: [], range: rangeTextMax) != nil {
            
                formatterDate.dateFormat = "dd.MM.yyyy"
                
                let min = formatterDate.date(from: views.minDateTextField.text!)!
                let max = formatterDate.date(from: views.maxDateTextField.text!)!
                
                let result = realmMethods.filterDate(min: min, max: max)
                
                listIncome = result
                
                updateBalance(object: listIncome)
                
                tableView.reloadData()

                
            } else {
            
                self.present(alertForIncome, animated: true, completion: nil)
                
            }
            
        } else {
            
            self.present(alertForIncome, animated: true, completion: nil)

        }
    }
    
    @objc func tapBackList (_ sender: UIButton) {
        
        listIncome = realmMethods.filterArrayTimeIncome()
        updateBalance(object: listIncome)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return listIncome.count
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! IncomeTableViewCell
        cell.backgroundColor = UIColor.clear

            
        cell.addText(objectList: listIncome[indexPath.row])
    
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let infoAction = UIContextualAction(style: .normal, title:  "Комментарий", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            let vc = CommentViewController(textForTextViewComment: self.listIncome[indexPath.row].Comment, index: indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)
            
            success(true)
        })
        
        infoAction.backgroundColor = UIColor.gray
        
        let deleteAction = UIContextualAction(style: .normal, title:  "Удалить", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            let object = self.listIncome[indexPath.row]
            self.money -= object.totalMoney
            self.realmMethods.deleteOption(object: object)
            
            self.listIncome = self.realmMethods.filterArrayTimeIncome()
            tableView.reloadData()
            
            success(true)
        })
        
        deleteAction.backgroundColor = UIColor.skyColor
        
        return UISwipeActionsConfiguration(actions: [infoAction,deleteAction])
    }
    
    
}

