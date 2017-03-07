//
//  GraphCollectionViewCell.swift
//  Proposal
//
//  Created by Ryan Campanella on 3/1/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit
import Charts
import Foundation

class GraphCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    func setUp(surveyData: SurveyData) {
        titleLabel.text = surveyData.title
        
        setPieChartGraphDataWithSurveyData(surveyData: surveyData)
    }
    
    func setPieChartGraphDataWithSurveyData(surveyData: SurveyData) {
        
        let pieChartData = PieChartData()
        let pieChartDataSet = PieChartDataSet()
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0

        for i in 0..<surveyData.values.count {
            let pieChartDataEntry = PieChartDataEntry(value: surveyData.values[i], label: surveyData.labels[i])
            pieChartDataSet.addEntry(pieChartDataEntry)
        }

        pieChartDataSet.colors = ChartColorTemplates.colorful()
        pieChartDataSet.label = nil
        pieChartDataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
        
        pieChartData.addDataSet(pieChartDataSet)
        
        pieChartView.chartDescription?.text = surveyData.description
        pieChartView.data = pieChartData
        configurePieGraphDisplaySettings()
    }
    
}

// MARK: - Collection View Configure
extension GraphCollectionViewCell {
<<<<<<< HEAD
    func configurePieGraphDisplaySettings() {
=======
    
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
>>>>>>> b5ac11252235df17c41a115c7ae17021dd2b8757
        
        pieChartView.usePercentValuesEnabled = true
        pieChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.5)
    }
}
