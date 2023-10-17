//
//  LoginViewModel.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 19/10/2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var isEmailValid = true
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*])[A-Za-z!@#$%^&*]{8,20}@gmail\.com$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email) && email.count >= 8
    }
}
