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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
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
        
        self.pieChartView.chartDescription?.text = surveyData.description
        self.pieChartView.data = pieChartData
        configurePieGraphDisplaySettings()
    }
    
}

// MARK: - Collection View Configure
extension GraphCollectionViewCell {
    func configurePieGraphDisplaySettings() {
        
        self.pieChartView.usePercentValuesEnabled = true
        self.pieChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.5)
    }
}
