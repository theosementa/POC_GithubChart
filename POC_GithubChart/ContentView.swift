//
//  ContentView.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var contributions: [Contribution] = Contribution.generate()
    
    var body: some View {
        ContributionChartView(contributions: contributions)
            .padding()
    }
}

#Preview {
    ContentView()
}
