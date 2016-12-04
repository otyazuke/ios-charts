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
    
    var userId: String? = nil
    
    @IBOutlet weak var graphView: BarChartView!
    var manths: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TwitterAPI.getTweets(user: userId!, keyWord: "やばい")
        
        manths = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
        let unitsSlid = [50.3, 68.3, 113.3, 115.7, 160.8, 214.0, 220.4, 132.1, 176.2, 120.9, 71.3, 48.0]
        
        graphView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        graphView.animate(yAxisDuration: 2.0)
        graphView.pinchZoomEnabled = false
        graphView.drawBarShadowEnabled = false
        graphView.drawBordersEnabled = false
        graphView.chartDescription?.text = "テストグラフ"
        
        setChart(dataPoints: manths, values: unitsSlid)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setChart(dataPoints: [String], values: [Double]) {
        graphView.noDataText = "You need to provide data for the chart"
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values[i]])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "降水量")
        let chartData = BarChartData(dataSet: chartDataSet)
        graphView.data = chartData
    }

}

