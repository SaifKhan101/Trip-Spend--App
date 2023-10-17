//
//  ForgetPasswordEmailSent.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 19/10/2023.
//

import SwiftUI

struct ForgetPasswordEmailSent: View {
    @State var email = ""
    var body: some View {
        VStack {
            Image("image 7")
                .padding(.top, 60)
            VStack(alignment: .center, spacing: 15) {
                Text("Your Email is on the the way")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Check your email \(email) and follow the instruction to reset your password ")
                    .padding([.top, .leading, .trailing])
                    .padding(.horizontal)
                    .font(.subheadline)
            }
            .padding(.vertical)
            Spacer()
            NavigationLink(destination: LogIn_View()) {
                Text("Continue")
                    .frame(width: 280, height: 60)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(Color.black.opacity(0.9))
                    )
            }
        }
    }
}

#Preview {
    ForgetPasswordEmailSent()
}
