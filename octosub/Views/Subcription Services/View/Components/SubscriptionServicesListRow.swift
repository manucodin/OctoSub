//
//  SubscriptionServicesListRow.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI

struct SubscriptionServicesListRow: View {
    var subscriptionService: SubscriptionService

    var body: some View {
        ZStack {
            VStack {
                HStack (spacing: 16){
                    AsyncImage(url: URL(string: subscriptionService.icon)) { image in
                           image
                               .resizable()
                               .scaledToFill()
                       } placeholder: {
                           ProgressView()
                       }
                       .frame(width: 44, height: 44)
                    VStack (alignment: .leading){
                        Text(subscriptionService.name)
                            .foregroundColor(.black)
                            .font(.title3)
                            .bold()
                        Text(subscriptionService.category.capitalized)
                            .foregroundColor(Color.black.opacity(0.6))
                            .font(.system(size: 15))
                    }
                    Spacer()
                }.padding(.horizontal, 8)
                Divider().foregroundColor(.separator).padding(.horizontal, 8).frame(height: 1)
            }
        }
        .frame(height: 60)
        .cornerRadius(4)
    }
}

struct SubscriptionServicesListRow_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionServicesListRow(subscriptionService: SubscriptionServiceMother.netflix)
            .previewLayout(.sizeThatFits)
    }
}
