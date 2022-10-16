//
//  DateDuration.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

struct DateDuration {
    let value: Int
    let dateType: DateType
    
    var formattedDuration: String {
        return "\(value) \(dateType.stringValue)"
    }
    
    var timeInterval: TimeInterval {
        return dateType.timeInterval * Double(value)
    }
    
    var numberOfDays: Int {
        switch dateType {
        case .daily: return value*1
        case .weekly: return value*7
        case .monthly: return value*30
        case .annually: return value*365
        }
    }
    
    init(value: Int, dateType: DateType) {
        self.value = value
        self.dateType = dateType
    }
    
    init(numberOfDays: Int, dateType: DateType) {
        switch dateType {
        case .daily:
            self.value = numberOfDays/1
        case .weekly:
            self.value = numberOfDays/7
        case .monthly:
            self.value = numberOfDays/30
        case .annually:
            self.value = numberOfDays/365
        }
        self.dateType = dateType
    }
}
