//
//  UserSubscriptionsEmptyView.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI

struct UserSubscriptionsEmptyView: View {
    var body: some View {
        VStack (spacing: 8){
            Spacer()
            Image("subscriptions")
                .resizable()
                .frame(width: 100, height: 100)
            Text("empty_subscriptions_message".localized)
                .bold()
                .font(.title3)
                .foregroundColor(Color.black.opacity(0.4))
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct UserSubscriptionsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        UserSubscriptionsEmptyView()
    }
}
