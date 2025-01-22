//
//  ContributionChartView.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import SwiftUI

struct ContributionChartView: View {
    let contributions: [Contribution]
    let config: ContributionChartConfig
    
    init(contributions: [Contribution], config: ContributionChartConfig = .default) {
        self.contributions = contributions.sorted { $0.date < $1.date }
        self.config = config
    }
    
    private var weeklyData: [WeekData] {
        var result: [WeekData] = []
        let calendar = Calendar.current
        
        guard let firstDate = contributions.first?.date else { return [] }
        
        let firstWeek = calendar.component(.weekOfYear, from: firstDate)
        var currentWeek = WeekData(weekNumber: firstWeek)
        
        for contribution in contributions {
            let weekday = calendar.component(.weekday, from: contribution.date)
            let weekNumber = calendar.component(.weekOfYear, from: contribution.date)
            
            if weekNumber != currentWeek.weekNumber {
                result.append(currentWeek)
                currentWeek = WeekData(weekNumber: weekNumber)
            }
            
            let dayIndex = (weekday + 5) % 7
            currentWeek.days[dayIndex] = contribution
        }
        
        if !currentWeek.days.isEmpty {
            result.append(currentWeek)
        }
        
        return result
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(spacing: 8) {
                HStack {
                    ForEach(Calendar.current.monthSymbols, id: \.self) { month in
                        Text(month.prefix(3))
                            .frame(maxWidth: .infinity)
                    }
                }
                HStack(spacing: config.spacing) {
                    ForEach(weeklyData.indices, id: \.self) { weekIndex in
                        ContributionColumn(
                            weekData: weeklyData[weekIndex],
                            config: config
                        )
                    }
                }
            }
            .padding()
        }
    }
}

