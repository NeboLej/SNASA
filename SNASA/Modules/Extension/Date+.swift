//
//  Date+.swift
//  SNASA
//
//  Created by Nebo on 27.07.2023.
//

import Foundation

fileprivate let DATE_FULL_YEAR_FMT: DateFormatter = {
    let fmt = DateFormatter()
    fmt.dateFormat = "yyyy-MM-dd"
    return fmt
}()

extension Date {
    func toSimpleDate() -> String {
        DATE_FULL_YEAR_FMT.string(from: self)
    }
    
    func addDay(day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: self)!
    }
}
