//
//  UserSubscriptionsViewHeader.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI

struct UserSubscriptionsViewHeader: View {
    @Binding var totalAmmount: String

    var body: some View {
        ZStack {
            Color.blueHeader.ignoresSafeArea()
            VStack {
                Text(totalAmmount)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 35))
            }
        }.frame(maxHeight: 200)
    }
}

struct UserSubscriptionsViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserSubscriptionsViewHeader(totalAmmount: .constant("$10.50"))
    }
}
