//
//  DiagramController.swift
//  MoneyDay
//
//  Created by Иван on 02.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import RealmSwift
import Charts


class DiagramIncomeController: UIViewController {
    
    let labelIncomeDiagram = DiagramIncomeLable()
    let realmMethods = RealmMethods ()
    var listOptionIncome = [OptionListObject]()
    var listCategory = [ListCategoryIncome]()
    
    var categorys = [String]()
    
    var diagram = PieChartView()
    
    let backBtn = DiagramIncomeBackBtn()
    let nextDiagramBtn = NextDiagramBtn()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOptionIncome = realmMethods.getList()
        listCategory = realmMethods.getCategory()
        
        for index in 0..<listOptionIncome.endIndex {
            
            if !categorys.contains(listOptionIncome[index].Category) {
                 categorys.append(listOptionIncome[index].Category)
            }
            
        }
        
        var PieChartDataEnryArray = [PieChartDataEntry]()
        
        for index in categorys {
            let Data =  PieChartDataEntry(value: realmMethods.ChartIncome(category: index), label: index)
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
        nextDiagramBtn.addTarget(self, action: #selector(tapNextDiagram(_ :)), for: .touchUpInside)
        
        let imagePNG = UIImage(named: "backgr.png")!
        view.backgroundColor = UIColor(patternImage: imagePNG)
        
        view.addSubview(nextDiagramBtn)
        view.addSubview(labelIncomeDiagram)
        view.addSubview(diagram)
        view.addSubview(backBtn)
        view.addConstraints([
            
            nextDiagramBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            nextDiagramBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            nextDiagramBtn.widthAnchor.constraint(equalToConstant: 35),
            nextDiagramBtn.heightAnchor.constraint(equalToConstant: 35),
            
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
    
    @objc func tapNextDiagram (_ sender: UIButton) {
        let VC = DiagramCostsController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
}
