//
//  CreateAccountView.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 17/10/2023.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var emailText = ""
    @State private var passwordText = ""
    var body: some View {
//        NavigationView {
            VStack(spacing: 2) {
                ZStack() {
                    Color(Color.black.opacity(0.9))
                        .ignoresSafeArea()
                        .frame(height: 110)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Create new account")
                            .padding(.horizontal)
                            .font(.title)
                            .padding(.top)
                            .foregroundColor(.white)
                            .offset(x: -35, y: -5)
                        Text("About time you start managing your finances")
                            .padding(.horizontal)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .offset(x: -35)
                    }
                }
                .padding(.bottom)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Email")
                        .padding(.horizontal)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                            .frame( height: 50)
                            .padding()
                        TextField("Enter your email", text: $emailText)
                            .padding(.horizontal,20)
                            .padding(.leading)
                    }
                    Text("Create Password")
                        .padding(.horizontal)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                            .frame( height: 50)
                            .padding()
                        TextField("Create a strong password", text: $passwordText)
                            .padding(.horizontal, 20)
                            .padding(.leading)
                        
                        Image(systemName: "eye.circle")
                            .renderingMode(.original)
                            .offset(x: 150)
                    }
                    Text("Confirm Password")
                        .padding(.horizontal)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                            .frame( height: 50)
                            .padding()
                        TextField("Re-enter the password", text: $passwordText)
                            .padding(.horizontal, 20)
                            .padding(.leading)
                        
                        Image(systemName: "eye.circle")
                            .renderingMode(.original)
                            .offset(x: 150)
                    }
                    HStack(alignment: .center) {
                        Link(destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/, label: {
                            Text("By signing up, you agree to terms of service and privacy policy")
                                .foregroundColor(.red)
                        })

                    }
                    .padding()
                }
                Spacer()
                Spacer()
                NavigationLink(destination: LogIn_View()) {
                    Text("Create Account")
                        .frame(width: 280, height: 50)
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.9))
                        )
                }
                NavigationLink(destination: LogIn_View()) {
                    Text("Alerady have an account?")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                }
                .padding(.bottom, 4.0)
            }
//        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


#Preview {
    CreateAccountView()
}
