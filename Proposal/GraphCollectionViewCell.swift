//
//  GraphCollectionViewCell.swift
//  Proposal
//
//  Created by Ryan Campanella on 3/1/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit
import Charts

class GraphCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var barChartView: BarChartView!
    
    func setUp(surveyData: SurveyData) {
        titleLabel.text = surveyData.title
        
        setMultipleBarGraphDataWithSurveyData(surveyData: surveyData)
    }
    
    func setMultipleBarGraphDataWithSurveyData(surveyData: SurveyData) {
        
        var dataSets: [BarChartDataSet] = []
        for i in 0..<surveyData.values.count {
            var dataEntries: [BarChartDataEntry] = []
            for j in 0..<surveyData.values[i].count {
                let dataEntry = BarChartDataEntry(x: Double(j), y: surveyData.values[i][j])
                dataEntries.append(dataEntry)
            }
            let chartDataSet = BarChartDataSet(values: dataEntries, label: surveyData.dataLabels[i])
            chartDataSet.colors = ChartColorTemplates.colorful()
            dataSets.append(chartDataSet)
        }
        let chartData = BarChartData(dataSets: dataSets)
        
        configureBarGraphDisplaySettings()
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:surveyData.dataSetIdentifiers)
        barChartView.data = chartData
    }
}

// MARK: - Collection View Configue
//
extension GraphCollectionViewCell {
    
    func configureBarGraphDisplaySettings() {
        barChartView.chartDescription?.text = ""
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.highlightPerTapEnabled = false
        barChartView.highlightPerDragEnabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.drawLabelsEnabled = false
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
}
