//
//  ForgetPassword.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 17/10/2023.
//

import SwiftUI

struct ForgetPassword: View {
    @State private var email = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Forgot your password?")
                .font(.title)
                .fontWeight(.semibold)
            Text("Let's admit it. We all have been there.But no worries, we have got you(just like all the other apps)")
                .font(.subheadline)
        }
        .padding()
        VStack(alignment: .leading, spacing: 2) {
            Text("Email")
                .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
                    .frame( height: 50)
                    .padding()
                TextField("Enter your email", text: $email)
                    .padding(.horizontal,20)
                    .padding(.leading)
            }
        }
        .padding(.bottom)
        Spacer()
        
        NavigationLink(destination: ForgetPasswordEmailSent()) {
            Text("Send reset link to my email")
                .frame(width: 280, height: 50)
                .foregroundColor(.white)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.9))
                )
        }
        NavigationLink(destination: LogIn_View()) {
            Text("Cancel")
                .frame(width: 280, height: 50)
                .foregroundColor(.red)
                .overlay(Capsule().stroke(Color.red.opacity(0.4), lineWidth: 1))
        }
        .padding(.bottom)
    }
}

#Preview {
    ForgetPassword()
}
