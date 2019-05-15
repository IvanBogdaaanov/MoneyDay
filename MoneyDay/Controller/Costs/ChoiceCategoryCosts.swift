//
//  ChoiceCategoryCosts.swift
//  MoneyDay
//
//  Created by Иван on 01.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class ChoiceCategoryCosts: UITableViewController {
    
    let views = ChoiceHeaderCosts()
    let id = "numberTwo"
    let realmMethods = RealmMethods()
    var categorys = [ListCategoryCosts]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        categorys = realmMethods.getCategoryCosts()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagePNG = UIImage(named: "backgr3.png")
        let imageView = UIImageView(image: imagePNG)
        tableView.backgroundView = imageView

        
        tableView.register(ChoiceCategoryTableViewCellCosts.self, forCellReuseIdentifier: id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categorys.isEmpty {
            
            return 0
            
        } else {
            
            return categorys.count
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! ChoiceCategoryTableViewCellCosts
        
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
            self.categorys = self.realmMethods.getCategoryCosts()
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
            let object = ListCategoryCosts(categoryAdd: views.textFieldCategory.text!)
            realmMethods.addInRealmCategoryCosts(object)
            categorys = realmMethods.getCategoryCosts()
            tableView.reloadData()
        }
    }
}
