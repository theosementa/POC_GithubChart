//
//  Date+Extensions.swift
//  POC_GithubChart
//
//  Created by Theo Sementa on 19/01/2025.
//

import Foundation

extension Date {
    var startOfYear: Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        return calendar.date(from: components)
    }
    
    var endOfYear: Date? {
        guard let startOfYear = self.startOfYear else { return nil }
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 1
        components.day = -1
        return calendar.date(byAdding: components, to: startOfYear)
    }
}
