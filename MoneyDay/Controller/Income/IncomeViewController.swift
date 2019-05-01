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
    
    var filterList = [OptionListObject]()
    
    var money: Double = 0 {
        didSet {
            views.labelTotal.text = "Сумма \(money) \u{20BD}"
        }
    }
    let formatterDate = DateFormatter()
    let views = IncomeHeaderForTable()
    let id = "numberOne"
    let realmMethods = RealmMethods()
    var filterYear = [OptionListObject]()
    var listIncome = [OptionListObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listIncome = realmMethods.getList()
        listIncome.reverse()
        tableView.reloadData()
        updateBalance(object: listIncome)
        views.labelTotal.text = "Сумма \(money) \u{20BD}"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @objc func addTableCell(_ sender: UIButton) {
        filterList.removeAll()
        
        let vc = IncomeEditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backMain(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapBtnFilter(_ sender: UIButton) {
        
        if !(views.minDateTextField.text?.isEmpty)! {
            if !(views.maxDateTextField.text?.isEmpty)! {
                
                formatterDate.dateFormat = "dd.MM.yyyy"
                
                let min = formatterDate.date(from: views.minDateTextField.text!)!
                let max = formatterDate.date(from: views.maxDateTextField.text!)!
                
                let result = realmMethods.filterDate(min: min, max: max)
                
                filterList = result
                
                updateBalance(object: filterList)
                
                tableView.reloadData()
                
            }
        }
    }
    
    @objc func tapBackList (_ sender: UIButton) {
        
        filterList.removeAll()
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        views.addBtn.addTarget(self, action: #selector(addTableCell(_:)), for: .touchUpInside)
        views.backBtn.addTarget(self, action: #selector(backMain(_:)), for: .touchUpInside)
        views.btnFilter.addTarget(self, action: #selector(tapBtnFilter(_:)) , for: .touchUpInside)
        views.btnReturn.addTarget(self, action: #selector(tapBackList(_:)), for: .touchUpInside)
        
        return views
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if filterList.isEmpty {
            
            return listIncome.count
            
        } else {
            
            return filterList.count
            
        }
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! IncomeTableViewCell
        cell.backgroundColor = UIColor.clear

        if filterList.isEmpty {
            
        cell.addText(objectList: listIncome[indexPath.row])
            
        } else {
            
            cell.addText(objectList: filterList[indexPath.row])
            
        }
        
        
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
            self.listIncome = self.realmMethods.getList()
            self.listIncome.reverse()
            tableView.reloadData()
            
            success(true)
        })
        
        deleteAction.backgroundColor = UIColor.skyColor
        
        return UISwipeActionsConfiguration(actions: [infoAction,deleteAction])
    }
    
    
}

