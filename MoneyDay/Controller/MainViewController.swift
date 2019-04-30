//
//  MainViewController.swift
//  MoneyDay
//
//  Created by Иван on 18.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
        
    let mainBalanceView = MainBalanceView()
    let mainView = MainView()
    let realmMethods = RealmMethods()
    var money:Double = 0
    var listIncome = [OptionListObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        listIncome = realmMethods.getList()
        listIncome.reverse()

        updateBalance()
        mainBalanceView.labelMoney.text = "Баланс: \(money) \u{20BD}"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        let imagePNG = UIImage(named: "backgr2.png")!
        view.backgroundColor = UIColor(patternImage: imagePNG)
        
        setupView()
        
    }
    
    func updateBalance() {
        money = 0
        for items in listIncome {
            money += items.totalMoney
        }
    }
    
    func setupView() {
        
        view.addSubview(mainView)
        view.addSubview(mainBalanceView)
        
        view.addConstraints([
            
            mainBalanceView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            mainBalanceView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            mainBalanceView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            mainBalanceView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/7),

            mainView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            mainView.topAnchor.constraint(equalTo: mainBalanceView.bottomAnchor, constant: 15),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)

            
            ])
        
        mainView.btnIncome.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
        
    }
    @objc func btnTap () {
        let VC = IncomeViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
}

