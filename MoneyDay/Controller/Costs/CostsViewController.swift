//
//  CostsViewController.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class CostsViewController: UITableViewController {
    
    let views = HeaderCosts()
    
    var filterList = [OptionListObjectCosts]()
    
    var money: Double = 0 {
        didSet {
            views.labelTotal.text = "Сумма \(money) \u{20BD}"
        }
    }
    let formatterDate = DateFormatter()
    let id = "numberOne"
    let realmMethods = RealmMethods()
    var filterYear = [OptionListObjectCosts]()
    var listCosts = [OptionListObjectCosts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let imagePNG = UIImage(named: "backgr.png")
        let imageView = UIImageView(image: imagePNG)
        tableView.backgroundView = imageView
        
        tableView.register(CostsTableViewCell.self, forCellReuseIdentifier: id)
        
        tableView.allowsSelection = false
        
        let tapGestureDate = UITapGestureRecognizer(target: self, action: #selector(tapGestureDate(gestureRecognizer:)))
        view.addGestureRecognizer(tapGestureDate)
        
    }
    
    @objc func tapGestureDate (gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listCosts = realmMethods.getListCosts()
        listCosts.reverse()
        tableView.reloadData()
        updateBalance(object: listCosts)
        views.labelTotal.text = "Сумма \(money) \u{20BD}"
    }
    
    func updateBalance(object: [OptionListObjectCosts]) {
        money = 0
        for items in object {
            money += items.totalMoney
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filterList.isEmpty {

            return listCosts.count

        } else {

            return filterList.count

        }
        
    }
//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CostsTableViewCell
        cell.backgroundColor = UIColor.clear

        if filterList.isEmpty {

            cell.addText(objectList: listCosts[indexPath.row])

        } else {

            cell.addText(objectList: filterList[indexPath.row])

        }
        
        
        return cell
    }
//
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let infoAction = UIContextualAction(style: .normal, title:  "Комментарий", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in

            let vc = CostsComment(textForTextViewComment: self.listCosts[indexPath.row].Comment, index: indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)

            success(true)
        })
        infoAction.backgroundColor = UIColor.gray

        let deleteAction = UIContextualAction(style: .normal, title:  "Удалить", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in

            let object = self.listCosts[indexPath.row]
            self.money -= object.totalMoney
            self.realmMethods.deleteOption(object: object)
            self.listCosts = self.realmMethods.getListCosts()
            self.listCosts.reverse()
            tableView.reloadData()

            success(true)
        })

        deleteAction.backgroundColor = UIColor.skyColor

        return UISwipeActionsConfiguration(actions: [infoAction,deleteAction])
    }
//    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
    
    @objc func addTableCell(_ sender: UIButton) {
        
        let vc = CostsEditInTableViewController()
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
                
                let result = realmMethods.filterDateCosts(min: min, max: max)
                
                filterList = result
                
                updateBalance(object: filterList)
                
                
                tableView.reloadData()
                
            }
        } else {
            
        }
    }
    
    @objc func tapBackList(_ sender: UIButton) {
        
        filterList.removeAll()
        tableView.reloadData()

    }
}
