//
//  ContributionChartConfig.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import Foundation
import SwiftUI

struct ContributionChartConfig {
    let blockColor: Color
    let blockBackgroundColor: Color
    let rectangleWidth: Double
    let spacing: Double
    let cornerRadius: Double
    
    static let `default` = ContributionChartConfig(
        blockColor: .green,
        blockBackgroundColor: .secondary.opacity(0.2),
        rectangleWidth: 16,
        spacing: 2,
        cornerRadius: 2
    )
}
