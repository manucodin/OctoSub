//
//  Date+Extensions.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 16/10/22.
//

import Foundation

extension Date {
    var timestamp: Int {
        return Int(self.timeIntervalSince1970)
    }
}
