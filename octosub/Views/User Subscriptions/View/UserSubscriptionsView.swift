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
                UserSubscriptionsViewHeader(
                    totalAmmount: $viewModel.totalAmountFormatted,
                    currentSubtitle: $viewModel.subtitle,
                    dateTypeSelected: $viewModel.dateTypeSelected
                )
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
                                    if let selectedSubscription = viewModel.selectedSubscription {
                                        NavigationView {
                                            CreateSubscriptionView(
                                                subscription: selectedSubscription,
                                                subscriptionService: selectedSubscription.subscriptionService,
                                                showView: $viewModel.showEditSubscription
                                            )
                                        }
                                    }
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
            }.navigationBarTitleDisplayMode(.inline)
        }.sheet(isPresented: $viewModel.showServicesList, onDismiss: {
            viewModel.loadSubscriptions()
        },content: {
            SubscriptionServicesListView(showView: $viewModel.showServicesList)
        }).sheet(isPresented: $viewModel.showEditSubscription, onDismiss: {
            viewModel.loadSubscriptions()
        }, content: {
            EmptyView()
        }).onAppear {
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
