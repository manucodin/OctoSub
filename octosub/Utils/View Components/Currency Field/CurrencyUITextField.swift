//
//  CurrencyUITextField.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 11/9/22.
//

import Foundation
import UIKit
import SwiftUI

class CurrencyUITextField: UITextField {
    @Binding private var value: Double
    private let formatter: NumberFormatter

    init(formatter: NumberFormatter, value: Binding<Double>) {
        self.formatter = formatter
        self._value = value
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: superview)
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        addTarget(self, action: #selector(resetSelection), for: .allTouchEvents)
        keyboardType = .numberPad
        textAlignment = .right
        sendActions(for: .editingChanged)
    }

    override func removeFromSuperview() {}

    override func deleteBackward() {
        text = textValue.digits.dropLast().string
        sendActions(for: .editingChanged)
    }

    private func setupViews() {
        textColor = .white
        tintColor = .white
        font = .systemFont(ofSize: 24, weight: .regular)
        text = currency(from: Decimal(value))
    }

    @objc private func editingChanged() {
        text = currency(from: decimal)
        resetSelection()
        updateValue()
    }

    @objc private func resetSelection() {
        selectedTextRange = textRange(from: endOfDocument, to: endOfDocument)
    }

    private func updateValue() {
        DispatchQueue.main.async { [weak self] in
            self?.value = self?.doubleValue ?? 0
        }
    }

    private var textValue: String {
        return text ?? ""
    }

    private var decimal: Decimal {
      return textValue.decimal / pow(10, formatter.maximumFractionDigits)
    }

    private var doubleValue: Double {
        return NSDecimalNumber(decimal: decimal).doubleValue
    }

    private func currency(from decimal: Decimal) -> String {
        return formatter.string(for: decimal) ?? ""
    }
}

extension StringProtocol where Self: RangeReplaceableCollection {
    var digits: Self { filter (\.isWholeNumber) }
}

extension String {
    var decimal: Decimal { Decimal(string: digits) ?? 0 }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}
