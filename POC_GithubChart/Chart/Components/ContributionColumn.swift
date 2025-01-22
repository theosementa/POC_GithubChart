//
//  ContributionColumn.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import SwiftUI

struct ContributionColumn: View {
    let weekData: WeekData
    let config: ContributionChartConfig
    
    var body: some View {
        VStack(spacing: config.spacing) {
            ForEach(0..<7, id: \.self) { dayIndex in
                if let contribution = weekData.days[dayIndex] {
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
