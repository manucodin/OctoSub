//
//  UserSubscriptionViewRow.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import SwiftUI

struct UserSubscriptionViewRow: View {
    var subscription: Subscription
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(subscription.subscriptionService?.icon ?? "")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading) {
                        Text(subscription.subscriptionService?.name ?? "")
                            .foregroundColor(.black)
                            .font(.title3)
                            .bold()
                        Text(subscription.subscriptionService?.category.capitalized ?? "")
                            .foregroundColor(Color.black.opacity(0.6))
                            .font(.system(size: 15))
                    }
                    Spacer()
                    Text(subscription.formattedPrice)
                        .foregroundColor(Color.black.opacity(0.6))
                        .font(.system(size: 15))
                }.padding(.horizontal, 8)
                Divider().foregroundColor(.separator).padding(.horizontal, 8).frame(height: 1)
            }
        }
        .frame(height: 60)
        .background(.white)
    }
}

struct UserSubscriptionViewRow_Previews: PreviewProvider {
    static var previews: some View {
        UserSubscriptionViewRow(subscription: SubscriptionMother.netflix)
    }
}
