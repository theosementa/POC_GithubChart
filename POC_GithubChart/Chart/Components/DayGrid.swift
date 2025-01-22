//
//  DayGrid.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 22/01/2025.
//

import SwiftUI

struct DayGrid: View {
    let monthData: MonthData
    let config: ContributionChartConfig
    
    private func getContributionsMatrix() -> [[Contribution?]] {
        let calendar = Calendar.current
        var matrix: [[Contribution?]] = []
        var currentWeek: [Contribution?] = Array(repeating: nil, count: 7)
        
        // Calculate offset for first day of month
        let firstWeekdayIndex = (monthData.firstWeekday + 5) % 7 // Convert to Monday-based index
        var currentIndex = firstWeekdayIndex
        
        for contribution in monthData.contributions {
            let weekday = calendar.component(.weekday, from: contribution.date)
            let dayIndex = (weekday + 5) % 7
            
            if dayIndex < currentIndex && !currentWeek.isEmpty {
                matrix.append(currentWeek)
                currentWeek = Array(repeating: nil, count: 7)
            }
            
            currentWeek[dayIndex] = contribution
            currentIndex = dayIndex
        }
        
        if !currentWeek.isEmpty {
            matrix.append(currentWeek)
        }
        
        return matrix
    }
    
    var body: some View {
        let matrix = getContributionsMatrix()
        
        VStack(spacing: config.spacing) {
            ForEach(matrix.indices, id: \.self) { week in
                HStack(spacing: config.spacing) {
                    ForEach(0..<7, id: \.self) { day in
                        if let contribution = matrix[week][day] {
                            ContributionBlock(
                                isContributed: contribution.isContributed,
                                config: config
                            )
                        } else {
                            Color.clear
                                .frame(width: config.rectangleWidth, height: config.rectangleWidth)
                        }
                    }
                }
            }
        }
    }
}
