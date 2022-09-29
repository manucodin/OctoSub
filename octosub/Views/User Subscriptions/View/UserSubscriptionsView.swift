//
//  UserSubscriptionsView.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI

struct UserSubscriptionsView: View {
    @StateObject var viewModel = UserSubscriptionsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                UserSubscriptionsViewHeader(totalAmmount: $viewModel.totalAmountFormatted)
                ZStack {
                    if viewModel.subscriptions.isEmpty {
                        UserSubscriptionsEmptyView()
                    } else {
                        List(viewModel.subscriptions) { subscription in
                            UserSubscriptionViewRow(subscription: subscription)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    viewModel.select(subscription: subscription)
                                }
                                .sheet(isPresented: $viewModel.showEditSubscription, onDismiss: {
                                    viewModel.loadSubscriptions()
                                },content: {
                                    EmptyView()
                                })
                        }
                        .listStyle(.plain)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("app_name".localized.capitalized)
                        .font(.title3)
                        .foregroundColor(.white)
                        .bold()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.presentServiceList()
                    }, label: {
                        Image(systemName: "plus")
                            .font(Font.system(.title3))
                            .foregroundColor(.white)
                    })
                }
            }
        }.sheet(isPresented: $viewModel.showServicesList, content: {
            SubscriptionServicesListView(showView: $viewModel.showServicesList)
        }).sheet(isPresented: $viewModel.showEditSubscription, onDismiss: {
            viewModel.loadSubscriptions()
        }, content: {
            EmptyView()
        }).onAppear {
            NavigationStyles.applyBlueHeaderStyle()
        }
    }
}

struct UserSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSubscriptionsView()
    }
}
