//
//  SubscriptionPriceView.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 11/9/22.
//

import SwiftUI

struct SubscriptionPriceView: View {
    let iconURL: URL?
    let numberFormatter: NumberFormatter
    
    @Binding var value: Double
    
    var body: some View {
        VStack {
            AsyncImage(url: iconURL) { image in
                   image
                       .resizable()
                       .scaledToFill()
               } placeholder: {
                   ProgressView()
               }
               .frame(width: 80, height: 80)
            Spacer().frame(height: 24)
            HStack {
                Spacer()
                CurrencyTextField(numberFormatter: numberFormatter, value: $value)
                    .padding(12)
                    .background(Color.blueHeader)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(.clear)
                    }
                    .frame(width: 0, height: 30)
                    .padding(.bottom)
                Spacer()
            }
        }
    }
}

struct SubscriptionPriceView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionPriceView(
            iconURL: URL(string: SubscriptionServiceMother.netflix.icon),
            numberFormatter: NumberFormatter(),
            value: .constant(.zero)
        )
    }
}
