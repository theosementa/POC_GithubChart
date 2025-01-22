//
//  MonthlyContributionChartView.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 22/01/2025.
//

import SwiftUI

struct MonthlyContributionChartView: View {
    
    // builder
    let contributions: [Contribution]
    let config: ContributionChartConfig
    
    init(contributions: [Contribution], config: ContributionChartConfig = .default) {
        self.contributions = contributions.sorted { $0.date < $1.date }
        self.config = config
    }
    
    private var monthlyData: [MonthData] {
        let calendar = Calendar.current
        var monthsData: [MonthData] = []
        
        let groupedByMonth = Dictionary(grouping: contributions) { contribution in
            calendar.component(.month, from: contribution.date)
        }
        
        for (month, monthContributions) in groupedByMonth.sorted(by: { $0.key < $1.key }) {
            guard let firstDayOfMonth = monthContributions.first?.date else { continue }
            
            let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
            let monthName = calendar.monthSymbols[month - 1]
            
            monthsData.append(MonthData(
                month: monthName,
                contributions: monthContributions,
                firstWeekday: firstWeekday
            ))
        }
        
        return monthsData
    }
    
    // MARK: -
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(monthlyData, id: \.month) { monthData in
                    MonthlyContributionChart(
                        monthData: monthData,
                        config: config
                    )
                }
            }
            .padding()
        }
    } // body
} // struct

// MARK: - Preview
#Preview {
    MonthlyContributionChartView(
        contributions: Contribution.generate(),
        config: .small
    )
}
