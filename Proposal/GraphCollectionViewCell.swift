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

        for i in 0..<surveyData.values.count {
            let pieChartDataEntry = PieChartDataEntry(value: surveyData.values[i], label: surveyData.labels[i])
            _ = pieChartDataSet.addEntry(pieChartDataEntry)
        }
        
        configurePieChartDataSetDisplaySettings(pieChartDataSet: pieChartDataSet)
        pieChartData.addDataSet(pieChartDataSet)
        
        pieChartView.data = pieChartData
        configurePieChartDisplaySettings()
    }
    
}

// MARK: - Collection View Configure
extension GraphCollectionViewCell {
    func getCustomFontType() -> NSUIFont {
        return NSUIFont(name: "ProximaNova-Semibold", size: 12.0)!
    }
    
    func configurePieChartDisplaySettings() {
        let font = getCustomFontType()
        
        pieChartView.chartDescription?.text = nil
        pieChartView.usePercentValuesEnabled = true
        pieChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.5)
        pieChartView.holeColor = backgroundColor
        pieChartView.legend.font = font
        pieChartView.legend.textColor = NSUIColor.white
    }
    
    func configurePieChartDataSetDisplaySettings(pieChartDataSet: PieChartDataSet) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        
        let font = getCustomFontType()
        pieChartDataSet.valueFont = font
        pieChartDataSet.colors = ChartColorTemplates.colorful()
        pieChartDataSet.label = nil
        pieChartDataSet.xValuePosition = .outsideSlice
        pieChartDataSet.valueTextColor = NSUIColor.white
        
        pieChartDataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
}
