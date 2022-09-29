//
//  DateFieldWithTextView.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 12/9/22.
//

import SwiftUI

struct DateFieldWithTextView: View {
    let title: String
    let dateTitle: String = ""
    
    @Binding var date: Date
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .foregroundColor(.black)
            DatePicker(dateTitle, selection: $date, displayedComponents: [.date])
                .accentColor(.blueHeader)
                .foregroundColor(.black)
        }
    }
}

struct DateFieldWithTextView_Previews: PreviewProvider {
    static var previews: some View {
        DateFieldWithTextView(
            title: "start_date".localized,
            date: .constant(Date())
        )
    }
}
