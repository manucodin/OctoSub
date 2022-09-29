//
//  CurrencyTextField.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 11/9/22.
//

import Foundation
import SwiftUI

struct CurrencyTextField: UIViewRepresentable {

    typealias UIViewType = CurrencyUITextField

    let currencyField: CurrencyUITextField

    init(numberFormatter: NumberFormatter, value: Binding<Double>) {
        currencyField = CurrencyUITextField(formatter: numberFormatter, value: value)
    }

    func makeUIView(context: Context) -> CurrencyUITextField {
        return currencyField
    }

    func updateUIView(_ uiView: CurrencyUITextField, context: Context) { }
}
