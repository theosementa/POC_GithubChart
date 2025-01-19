//
//  ContributionBlock.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import SwiftUI

struct ContributionBlock: View {
    let isContributed: Bool
    let config: ContributionChartConfig
    
    var body: some View {
        RoundedRectangle(cornerRadius: config.cornerRadius)
            .frame(width: config.rectangleWidth, height: config.rectangleWidth)
            .foregroundColor(isContributed ? config.blockColor : config.blockBackgroundColor)
    }
}
