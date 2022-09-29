//
//  SubscriptionServicesListView.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI

struct SubscriptionServicesListView: View {
    @StateObject var viewModel = SubscriptionServicesListViewModel()
    @Binding var showView: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                List (viewModel.subscriptionServices) { subscriptionService in
                    SubscriptionServicesListRow(subscriptionService: subscriptionService)
                        .listRowSeparator(.hidden)
                        .background{
                            NavigationLink("") {
                                CreateSubscriptionView(
                                    subscriptionService: subscriptionService,
                                    showView: $showView
                                )
                            }
                        }
                }
                .listStyle(.plain)
                .background(.white)
            }
            .navigationTitle("services".localized.capitalized)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showView.toggle()
                    }, label: {
                        Image(systemName: "chevron.down").tint(.black)
                    })
                }
            }
        }.onAppear {
            NavigationStyles.applyWhiteStyle()
            Task {
                await viewModel.loadSubscriptionServices()
            }
        }
    }
}

struct SubscriptionServicesListView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionServicesListView(showView: .constant(true))
    }
}
