//
//  Contribution.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//


import Foundation

struct Contribution: Identifiable, Hashable {
    let id: UUID = UUID()
    let date: Date
    let isContributed: Bool
}

extension Contribution {

    static func generate() -> [Contribution] {
        var contributions: [Contribution] = []
        guard let startOfYear = Date.now.startOfYear, let endOfYear = Date.now.endOfYear else { return [] }

        var currentDate = startOfYear
        while currentDate <= endOfYear {
            let contribution = Contribution(date: currentDate, isContributed: .random())
            contributions.append(contribution)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return contributions
    }
}
