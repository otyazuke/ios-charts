//
//  ViewController.swift
//  ios-charts
//
//  Created by tsuruda_takuya on 2016/11/30.
//  Copyright © 2016年 Takuya Tsuruda. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet var graphView: LineChartView!
    
    var manths: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manths = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
        let unitsSlid = [50.3, 68.3, 113.3, 115.7, 160.8, 214.0, 220.4, 132.1, 176.2, 120.9, 71.3, 48.0]
        
        self.graphView.chartDescription?.text = "tap node for details"
        self.graphView.chartDescription?.textColor = UIColor.white
        self.graphView.gridBackgroundColor = UIColor.darkGray
        self.graphView.noDataText = "No data provided"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setChart(dataPoints: [String], values: [Double]) {
        
        
    }

}

