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
    var tweetCount: [Int] = []
    
    @IBOutlet weak var graphView: BarChartView!
    var manths: [String]!
    var xData: [Double] = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tweetLabel: [String] = ["やばい","じゃないか説","わろ"]
        
        for i in 0..<tweetLabel.count {
            print(tweetLabel[i])
            tweetCount.append(TwitterAPI.getTweets(user: userId!, keyWord: tweetLabel[i]))
        }
        print("viewController value")
        
        graphView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        graphView.animate(yAxisDuration: 2.0)
        graphView.pinchZoomEnabled = false
        graphView.drawBarShadowEnabled = false
        graphView.drawBordersEnabled = false
        graphView.chartDescription?.text = "テストグラフ"
        graphView.xAxis.labelPosition = .bottom
        
        setChart(dataPoints: tweetLabel, values: tweetCount)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Int]) {
        graphView.noDataText = "You need to provide data for the chart"
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: xData[i], yValues: [Double(values[i])], label: dataPoints[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "ツイート数")
        let chartData = BarChartData(dataSet: chartDataSet)
        graphView.data = chartData
    }
    
}

