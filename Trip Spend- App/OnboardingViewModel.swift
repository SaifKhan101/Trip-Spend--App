//
//  OnboardingViewModel.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 19/10/2023.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var selectedTabIndex = 0
    @Published var isLoginViewPresented = false
}
