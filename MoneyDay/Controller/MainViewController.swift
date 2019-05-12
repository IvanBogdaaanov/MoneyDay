//
//  MainViewController.swift
//  MoneyDay
//
//  Created by Иван on 18.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import AlamofireObjectMapper

class MainViewController: UIViewController {
        
    let mainBalanceView = MainBalanceView()
    let mainView = MainView()
    let realmMethods = RealmMethods()
    var money:Double = 0
    var listIncome = [OptionListObject]()
    var listCosts = [OptionListObjectCosts]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listCosts = realmMethods.getListCosts()
        
        listIncome = realmMethods.getList()
        listIncome.reverse()

        updateBalance()
        mainBalanceView.labelMoney.text = "Баланс: \(money) \u{20BD}"
        
        let url = "https://www.cbr-xml-daily.ru/daily_json.js"
        
        Alamofire.request(url).responseObject { [weak self] (response: DataResponse<Welcome>) in
            guard let welcome = response.result.value else { return }
            if let usd = welcome.valute?["USD"], let value = usd.value {
                self?.mainView.updateCourse(value: value)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
            
        view.addBackGround(imageName: "backgr2.png")
        
        setupView()
        
    }
    
    
    
    func updateBalance() {
        money = 0
        for items in listIncome {
            money += items.totalMoney
        }
        
        for items in listCosts {
            money -= items.totalMoney
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
        
        mainView.btnIncome.addTarget(self, action: #selector(btnIncome(_:)), for: .touchUpInside)
        mainView.btnCosts.addTarget(self, action: #selector(btnCosts(_:)), for: .touchUpInside)
        mainView.btnDiagrams.addTarget(self, action: #selector(btnDiagrams(_:)), for: .touchUpInside)
    }
    
    @objc func btnDiagrams(_ sender: UIButton) {
        let VC = DiagramIncomeController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func btnIncome (_ sender: UIButton) {
        let VC = IncomeViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func btnCosts (_ sender: UIButton) {
        let VC = CostsViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
}

