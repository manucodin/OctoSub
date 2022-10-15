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

    var body: some View {
        ZStack {
            Color.blueHeader.ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        dateTypeSelected = .monthly
                    }, label: {
                        Text("Mensual")
                            .bold()
                            .foregroundColor(.white)
                    })
                    Button(action: {
                        dateTypeSelected = .weekly
                    }, label: {
                        Text("Semanal").bold().foregroundColor(.white)
                    })
                    Spacer()
                }.padding(.horizontal, 16).padding(.top, 8)
                Spacer()
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
        }.frame(maxHeight: 200)
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
