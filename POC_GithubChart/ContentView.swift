//
//  ContentView.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var contributions: [Contribution] = Contribution.generate()
    
    // MARK: -
    var body: some View {
        YearlyContributionChartView(contributions: contributions)
            .padding()
    } // body
} // struct

// MARK: - Preview
#Preview {
    ContentView()
}
