//
//  MultiplePicker.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 11/9/22.
//

import Foundation
import SwiftUI

struct TimeMultiplePicker: UIViewRepresentable {
    let selection: Binding<DateDuration?>
    let strategy: TimePickerStrategy
    
    func makeUIView(context: Context) -> UIPickerView {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = context.coordinator
        pickerView.dataSource = context.coordinator
        return pickerView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(selection: selection, strategy: strategy)
    }
    
    final class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        let selection: Binding<DateDuration?>
        let strategy: TimePickerStrategy
        var onSelect: ((DateDuration?) -> Void)? = nil
        
        init(selection: Binding<DateDuration?>, strategy: TimePickerStrategy) {
            self.selection = selection
            self.strategy = strategy
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return strategy.numberOfComponents(in: pickerView)
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return strategy.pickerView(pickerView, numberOfRowsInComponent: component)
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return strategy.pickerView(pickerView, titleForRow: row, forComponent: component)
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let duration = strategy.pickerView(pickerView, didSelectRow: row, inComponent: component)
            
            selection.wrappedValue = duration
            onSelect?(duration)
        }
    }
}
