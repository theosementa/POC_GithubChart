//
//  MonthlyContributionChart.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 22/01/2025.
//

import SwiftUI

struct MonthlyContributionChart: View {
    let monthData: MonthData
    let config: ContributionChartConfig
    
    private let weekDays = ["L", "M", "M", "J", "V", "S", "D"]
    
    var body: some View {
        VStack(spacing: 8) {
            Text(monthData.month)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: config.spacing) {
                HStack(spacing: config.spacing) {
                    ForEach(weekDays, id: \.self) { day in
                        Text(day)
                            .font(.caption)
                            .frame(width: config.rectangleWidth)
                    }
                }
                
                DayGrid(
                    monthData: monthData,
                    config: config
                )
            }
        }
    }
}
