//
//  OnBoardingPageView.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import SwiftUI

struct OnBoardingPageView: View {
    var imageName: String
    var message: String
    
    var body: some View {
        VStack (spacing: 14){
            Image(imageName)
                .resizable()
                .frame(width: 200, height: 300)
            Text(message)
                .bold()
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.blueHeader)
        }.frame(width: 300, height: 700)
    }
}

struct OnBoardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPageView(
            imageName: "onboarding_step_one",
            message: "onboarding_step_one".localized
        )
    }
}
