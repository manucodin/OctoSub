//
//  UserSubscriptionsViewHeader.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI

struct UserSubscriptionsViewHeader: View {
    @Binding var totalAmmount: String
    @Binding var currentSubtitle: String
    @Binding var dateTypeSelected: DateType

    let options: [DateType] = [.monthly, .weekly]
    
    var body: some View {
        ZStack {
            Color.blueHeader.ignoresSafeArea()
            VStack {
                HStack {
                    Picker("", selection: $dateTypeSelected) {
                        ForEach(options, id: \.self) { option in
                            Text(option.filterTitle)
                        }
                    }
                    .frame(width: 200)
                    .pickerStyle(.segmented)
                    .padding()
                    Spacer()
                }
                Text(totalAmmount)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 35))
                Text("your_expense".localized)
                    .foregroundColor(Color.white.opacity(0.6))
                    .bold()
                    .font(.system(size: 18))
                Spacer()
            }
        }
        .frame(maxHeight: 200)
        .onAppear {
            UISegmentedControl.appearance().selectedSegmentIndex = 0
            UISegmentedControl.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.6)
            UISegmentedControl.appearance().selectedSegmentTintColor = .white
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.blueHeader], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black.withAlphaComponent(0.8)], for: .normal)
        }
    }
}

struct UserSubscriptionsViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserSubscriptionsViewHeader(
            totalAmmount: .constant("$10.50"),
            currentSubtitle: .constant("January"),
            dateTypeSelected: .constant(.monthly)
        )
    }
}
