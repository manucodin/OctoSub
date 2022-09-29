//
//  CurrencyFormatter.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

class CurrencyFormatter: NumberFormatter {
    
    init(maximumFractionDigits: Int = 2) {
        super.init()
        self.numberStyle = .currency
        self.maximumFractionDigits = maximumFractionDigits
    }
    
    required init?(coder: NSCoder) { return nil }
}
