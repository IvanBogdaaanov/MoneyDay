//
//  DiagramCostsController.swift
//  MoneyDay
//
//  Created by Иван on 02.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift
import Charts

class DiagramCostsController: UIViewController {
    
    let labelIncomeDiagram = DiagramCostsLable()
    let realmMethods = RealmMethods ()
    var listOptionCosts = [OptionListObjectCosts]()
    var listCategory = [ListCategoryCosts]()
    
    var categorys = [String]()
    
    var diagram = PieChartView()
    
    let backBtn = DiagramCostsBackBtn()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOptionCosts = realmMethods.getListCosts()
        listCategory = realmMethods.getCategoryCosts()
        
        for index in 0..<listOptionCosts.endIndex {
            
            if !categorys.contains(listOptionCosts[index].Category) {
                categorys.append(listOptionCosts[index].Category)
            }
            
        }
        
        var PieChartDataEnryArray = [PieChartDataEntry]()
        
        for index in categorys {
            let Data =  PieChartDataEntry(value: realmMethods.ChartCosts(category: index), label: index)
            PieChartDataEnryArray.append(Data)
        }
        
        let chartDataSet = PieChartDataSet(values: PieChartDataEnryArray, label: nil)
        
        
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let color:[UIColor]  = [.diagramBlue, .diagramGreen, .diagramYellow, .diagramOrange, .diagramGray, .diagramPink, .diagramGreen2, .diagramBlue2, .diagramPurple, .diagramOrange2]
        
        chartDataSet.valueTextColor = .black
        chartDataSet.colors = color
        
        diagram.data = chartData
        
        
        
        diagram.translatesAutoresizingMaskIntoConstraints = false
        
        backBtn.addTarget(self, action: #selector(tapBackBtn(_:)), for: .touchUpInside)
        
        let imagePNG = UIImage(named: "backgr.png")!
        view.backgroundColor = UIColor(patternImage: imagePNG)
        
        view.addSubview(labelIncomeDiagram)
        view.addSubview(diagram)
        view.addSubview(backBtn)
        view.addConstraints([
            
            labelIncomeDiagram.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelIncomeDiagram.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            
            diagram.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            diagram.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.85),
            diagram.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diagram.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            backBtn.widthAnchor.constraint(equalToConstant: 35),
            backBtn.heightAnchor.constraint(equalToConstant: 35)
            
            ])
        
    }
    
    @objc func tapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
