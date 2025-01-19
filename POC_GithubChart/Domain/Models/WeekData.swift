//
//  WeekData.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import Foundation

struct WeekData {
    var days: [Contribution?]
    let weekNumber: Int
    
    init(weekNumber: Int) {
        self.days = Array(repeating: nil, count: 7)
        self.weekNumber = weekNumber
    }
}
