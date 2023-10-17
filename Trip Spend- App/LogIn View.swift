//
//  LogIn View.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 17/10/2023.
//

import SwiftUI

struct LogIn_View: View {
    @ObservedObject var VM = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack {
                ZStack() {
                    Color(Color.black.opacity(0.9))
                        .ignoresSafeArea()
                        .frame(height: 100)
                        
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Login to your account")
                            .font(.title)
                            .padding(.top)
                            .foregroundColor(.white)
                            .offset(x: -35, y: -5)
                        Text("Welcome back. Let's be responsible again")
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
                        if VM.isEmailValid {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                                .frame( height: 50)
                                .padding()
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red)
                                .frame( height: 50)
                                .padding()
                        }
                        TextField("Enter your email", text: $VM.emailText)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .padding(.horizontal,20)
                            .padding(.leading)
                            .onChange(of: VM.emailText) { newValue in
                                VM.isEmailValid = VM.isValidEmail(email: newValue)
                        }
                    }
                    
                    Text("Password")
                        .padding(.horizontal)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                            .frame( height: 50)
                            .padding()
                        TextField("Enter your password", text: $VM.passwordText)
                            .padding(.horizontal, 20)
                            .padding(.leading)
                        
                        Image(systemName: "eye.circle")
                            .renderingMode(.original)
                            .offset(x: 150)
                    }
                    NavigationLink(destination: {
                        ForgetPassword()
                    }, label: {
                        Text("Forget Password?")
                            .foregroundColor(.black)
                            .accessibilityAddTraits([.isButton])
                            .multilineTextAlignment(.trailing)
                        
                    })
                    .offset(x: 230)
                    .padding(1)
                }
                Spacer()
                if !VM.isEmailValid {
                    
                    Text("Invalid email address")
                        .foregroundColor(.red)
                }
                NavigationLink(destination: TripModel()) {
                    Text("Login")
                        .frame(width: 280, height: 50)
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.9))
                        )
                }
                NavigationLink(destination: CreateAccountView()) {
                    Text("I don't have an account")
                        .frame(width: 280, height: 50)
                        .foregroundColor(.black)
                        .overlay(Capsule().stroke(Color.black.opacity(0.4), lineWidth: 1))
                }
                .padding(.bottom, 4.0)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


#Preview {
    LogIn_View()
}
