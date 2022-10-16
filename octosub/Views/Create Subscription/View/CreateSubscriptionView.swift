//
//  CreateSubscriptionView.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import SwiftUI
import BottomSheet

struct CreateSubscriptionView: View {
    @StateObject var viewModel: CreateSubscriptionViewModel
    @State var sheetPosition: BottomSheetPosition = .hidden
    
    init(subscription: Subscription? = nil, subscriptionService: SubscriptionService, showView: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: CreateSubscriptionViewModel(
            subscription: subscription,
            subscriptionService: subscription?.subscriptionService ?? subscriptionService,
            showView: showView
        ))
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack (spacing: 12){
                    Group {
                        SubscriptionPriceView(
                            iconURL: URL(string: viewModel.iconURL),
                            numberFormatter: viewModel.currencyFormatter,
                            value: $viewModel.subscriptionPrice
                        )
                        TextFieldWithTextView(
                            text: "Nombre",
                            value: $viewModel.subscriptionName
                        )
                        TextFieldWithTextView(
                            text: "Descripción",
                            value: $viewModel.userDescription
                        )
                        DateFieldWithTextView(
                            title: "start_date".localized,
                            date: $viewModel.subscriptionDate
                        )
                    }
                    Group {
                        if viewModel.showMoreOptions {
                            Group {
                                Divider().foregroundColor(.separator).frame(height: 1)
                                VStack {
                                    HStack {
                                        Text("payment_frequency".localized.capitalized)
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text(viewModel.paymentFrequency == nil ? "never".localized.capitalized : viewModel.paymentFrequency?.formattedDuration ?? "")
                                            .foregroundColor(.black)
                                    }.onTapGesture {
                                        sheetPosition = .dynamic
                                        viewModel.showDuration = false
                                        viewModel.showPaymentFrequency = true
                                        viewModel.showUserRecordatory = false
                                    }
                                }
                                Divider().foregroundColor(.separator).frame(height: 1)
                                VStack {
                                    HStack {
                                        Text("duration".localized.capitalized)
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text(viewModel.duration == nil ? "forever".localized.capitalized : viewModel.duration?.formattedDuration ?? "")
                                            .foregroundColor(.black)
                                    }.onTapGesture {
                                        sheetPosition = .dynamic
                                        viewModel.showDuration = true
                                        viewModel.showPaymentFrequency = false
                                        viewModel.showUserRecordatory = false
                                    }
                                }
                                Divider().foregroundColor(.separator).frame(height: 1)
                                VStack {
                                    HStack {
                                        Text("remember_me".localized.capitalized)
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text(viewModel.userRecordatory == nil ? "never".localized.capitalized : viewModel.userRecordatory?.formattedDuration ?? "")
                                            .foregroundColor(.black)
                                    }.onTapGesture {
                                        sheetPosition = .dynamic
                                        viewModel.showDuration = false
                                        viewModel.showPaymentFrequency = false
                                        viewModel.showUserRecordatory = true
                                    }
                                }
                            }
                        }
                        
                        Group {
                            if viewModel.isEditing {
                                Button(action: {
                                    viewModel.presentDeletAlert()
                                }, label: {
                                    HStack {
                                        Spacer()
                                        Text("delete".localized.uppercased())
                                            .bold()
                                            .tint(.red)
                                            .font(.callout)
                                        Image(systemName: "trash")
                                            .tint(.red)
                                            .font(.title3)
                                        Spacer()
                                    }
                                })
                            } else {
                                Button(action: {
                                    viewModel.showMoreOptions.toggle()
                                }, label: {
                                    HStack {
                                        Spacer()
                                        Text(viewModel.showMoreOptions ? "less_options".localized.uppercased() : "more_options".localized.uppercased())
                                            .bold()
                                            .tint(.black)
                                            .font(.callout)
                                        Image(systemName: viewModel.showMoreOptions ? "chevron.up" : "chevron.down")
                                            .tint(.black)
                                            .font(.title3)
                                        Spacer()
                                    }
                                })
                            }
                        }.padding(.top, 8)
                    }
                }
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text(viewModel.subscriptionService.name))
        .onAppear {
            NavigationStyles.applyWhiteStyle()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if viewModel.isEditing == false {
                    Button(action: {
                        Task {
                            await viewModel.saveSubscription()
                        }
                    }, label: {
                        Text("add".localized.capitalized)
                            .tint(.black)
                    })
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                if viewModel.isEditing == true {
                    Button(action: {
                        viewModel.dismissView()
                    }, label: {
                        Image(systemName: "chevron.down").tint(.black)
                    })
                }
            }
        }.bottomSheet(bottomSheetPosition: $sheetPosition, switchablePositions: [], headerContent: {
            HStack {
                Spacer()
                Text("Cerrar")
                    .foregroundColor(.blueHeader)
                    .onTapGesture {
                        sheetPosition = .hidden
                        viewModel.showDuration = false
                        viewModel.showUserRecordatory = false
                    }
            }.padding()
        }, mainContent: {
            if viewModel.showPaymentFrequency {
                TimeMultiplePicker(
                    selection: $viewModel.paymentFrequency,
                    strategy: viewModel.repetitionPicketStrategy
                )
            }
            if viewModel.showDuration {
                TimeMultiplePicker(
                    selection: $viewModel.duration,
                    strategy: viewModel.durationPickerStrategy
                )
            }
            if viewModel.showUserRecordatory {
                TimeMultiplePicker(
                    selection: $viewModel.userRecordatory,
                    strategy: viewModel.rememberPickerStrategy
                )
            }
        })
        .showDragIndicator(false)
        .onTapGesture {
            sheetPosition = .hidden
            viewModel.showDuration = false
            viewModel.showUserRecordatory = false
        }.alert("delete".localized.capitalized, isPresented: $viewModel.showDeleteAlert, actions: {
            Button(role: .destructive, action: {
                Task {
                    await viewModel.deleteSubscription()
                }
            }, label: {
                Text("delete".localized.capitalized).foregroundColor(.red)
            })
        }, message: {
            Text("delete_subscription_message".localized)
        }).alert("error_title_create_subscription".localized, isPresented: $viewModel.showError, actions: {}, message: {
            Text(viewModel.errorMessage)
        })
    }
}

struct CreateSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSubscriptionView(
            subscription: nil,
            subscriptionService: SubscriptionServiceMother.netflix,
            showView: .constant(true)
        )
    }
}
