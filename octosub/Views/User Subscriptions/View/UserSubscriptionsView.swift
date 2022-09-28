//
//  UserSubscriptionsView.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI

struct UserSubscriptionsView: View {
    @StateObject var viewModel = UserSubscriptionsViewModel()
    @State var showSubscription: Bool = false
    @State var selectedSubscription: Subscription? = nil
    
    var body: some View {
        ZStack {
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
                                    showSubscription = true
                                    selectedSubscription = subscription
                                }
                                .sheet(isPresented: $showSubscription, onDismiss: {
                                    viewModel.loadSubscriptions()
                                },content: {
                                    //TODO: - Create subscription
                                    EmptyView()
                                })
                        }
                        .listStyle(.plain)
                    }
                }
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Gastos")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title3)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.showAddSubscription = true
                }, label: {
                    Image(systemName: "plus")
                        .tint(.white)
                }).sheet(isPresented: $viewModel.showAddSubscription, onDismiss: {
                    viewModel.loadSubscriptions()
                }, content: {
                    //TODO: - Subscription Service List
                    EmptyView()
                })
            }
        }.onAppear {
            NavigationStyles.applyBlueHeaderStyle()
            viewModel.loadSubscriptions()
        }
    }
}

struct UserSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSubscriptionsView()
    }
}
