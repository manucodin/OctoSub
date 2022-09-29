//
//  OnBoardingViewModel.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation
import Combine

class OnBoardingViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var showFinal: Bool = false
    @Published var steps: [OnBoardingStep]
    
    var numberSteps: Int {
        return steps.count
    }
    
    private var subscribers: Set<AnyCancellable> = []
        
    init(steps: [OnBoardingStep]) {
        self.steps = steps
        $currentIndex.sink { currentIndex in
            self.showFinal = currentIndex == self.numberSteps - 1
        }.store(in: &subscribers)
    }
}
