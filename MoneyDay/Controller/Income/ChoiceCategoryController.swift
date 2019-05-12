//
//  ChoiceCategoryController.swift
//  MoneyDay
//
//  Created by Иван on 25.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class ChoiceCategoryController: UITableViewController {
    
    let views = ChoiceHeader()
    let id = "numberTwo"
    let realmMethods = RealmMethods()
    var categorys = [ListCategoryIncome]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        categorys = realmMethods.getCategory()
        categorys.reverse()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackGround(imageName: "backgr3.png")
        
        tableView.register(ChoiceCategoryTableViewCell.self, forCellReuseIdentifier: id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categorys.isEmpty {
            
            return 0
            
        } else {
            
            return categorys.count
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! ChoiceCategoryTableViewCell
        
        cell.addText(categorys[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        views.btnBack.addTarget(self, action: #selector(touchBtnBack(_:)), for: .touchUpInside)
        views.btnAddChoice.addTarget(self, action: #selector(touchBtnAdd(_:)), for: .touchUpInside)
        
        return views
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title:  "Удалить", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            let object = self.categorys[indexPath.row]
            self.realmMethods.deleteOption(object: object)
            self.categorys = self.realmMethods.getCategory()
            self.categorys.reverse()
            tableView.reloadData()
            
            success(true)
        })
        
        deleteAction.backgroundColor = UIColor.skyColor
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    @objc func touchBtnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func touchBtnAdd(_ sender: UIButton) {
        if !(views.textFieldCategory.text?.isEmpty)! {
            let object = ListCategoryIncome(categoryAdd: views.textFieldCategory.text!)
            realmMethods.addInRealmCategory(object)
            categorys = realmMethods.getCategory()
            categorys.reverse()
            tableView.reloadData()
        }
    }
}
