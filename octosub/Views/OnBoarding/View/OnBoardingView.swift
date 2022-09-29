//
//  OnBoardingView.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import SwiftUI

struct OnBoardingView: View {
    
    @StateObject private var onBoardingViewModel = OnBoardingViewModel(steps: [
        OnBoardingStep(
            image: "onboarding_step_one",
            message: "onboarding_step_one".localized
        ),
        OnBoardingStep(
            image: "onboarding_step_one",
            message: "onboarding_step_two".localized
        ),
        OnBoardingStep(
            image: "onboarding_step_one",
            message: "onboarding_step_three".localized
        )
    ])
    @EnvironmentObject private var appSettingsViewModel: AppSettingsViewModel

    
    var body: some View {
        ZStack {
            VStack {
                TabView (selection: $onBoardingViewModel.currentIndex){
                    ForEach(Array(onBoardingViewModel.steps.enumerated()), id: \.offset) { index, step in
                        OnBoardingPageView(
                            imageName: step.image,
                            message: step.message
                        )
                    }
                }
                .tabViewStyle(.page)
                Button(onBoardingViewModel.showFinal ? "continue".localized.capitalized : "exit".localized.capitalized) {
                    appSettingsViewModel.closeOnBoarding()
                }
                .frame(
                    width: UIScreen.main.bounds.size.width - 20,
                    height: 40
                ).modifier(OnBoardingButtonModifier(isFinish: $onBoardingViewModel.showFinal))
            }
        }.onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .blueHeader
            UIPageControl.appearance().pageIndicatorTintColor = .blueHeader.withAlphaComponent(0.6)
        }
    }
}

struct OnBoardingButtonModifier: ViewModifier {
    @Binding var isFinish: Bool
    
    func body(content: Content) -> some View {
        content
            .background(isFinish ? Color.blueHeader : Color.white)
            .tint(isFinish ? Color.white : Color.blueHeader)
            .cornerRadius(4)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
