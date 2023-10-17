//
//  OnboardingView.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 17/10/2023.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var vm = OnboardingViewModel()
    
    var body: some View {
        TabView(selection: $vm.selectedTabIndex) {
            OnboardingScreen(imageName: "step1Image", content: "You ought to know where your money goes", vm: vm)
                .tag(0)
            Onboarding2(imageName: "step2Image", content: "Gain Control of your money", vm: vm)
                .tag(1)
            Onboarding3(imageName: "step3Image", content: "Plan ahead and manage your money better", vm: vm)
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea(edges: .all)
        .fullScreenCover(isPresented: $vm.isLoginViewPresented) {
            LogIn_View()
        }
    }
}
struct OnboardingScreen: View {
    let imageName: String
    let content: String
    @ObservedObject var vm: OnboardingViewModel

    var body: some View {
        VStack {
            ZStack {
                Image(imageName)
                    .scaledToFill()
                    .frame(maxHeight: 420)
                    .frame(minHeight: 250)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.9))
                    .padding(.bottom)
                
                Button(action: {
                    vm.isLoginViewPresented.toggle()
                }) {
                    Text("Skip")
                        .frame(width: 60, height: 30)
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.4))
                        )
                }
                .offset(x: 140, y: -200)
            }
            VStack(spacing: 8) {
                Text(content)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text("Get an overview of how you are performing and motivate yourself to achieve more")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding()
            Spacer()
            PageControl(numberOfPages: 3, currentPage: $vm.selectedTabIndex)
                .padding(.bottom, 40)
            Button(action: {
                if vm.selectedTabIndex < 2 {
                    vm.selectedTabIndex += 1
                } else {
                    vm.isLoginViewPresented.toggle()
                }
            }) {
                Text(vm.selectedTabIndex < 2 ? "Next" : "Get Started")
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(Color.black.opacity(0.9))
                    )
            }
            .padding(.bottom, 4.0)
        }
    }
}

struct Onboarding2: View {
    let imageName: String
    let content: String
    @ObservedObject var vm: OnboardingViewModel

    var body: some View {
        VStack {
            ZStack {
                Image(imageName)
                    .scaledToFill()
                    .frame(maxHeight: 420)
                    .frame(minHeight: 250)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.9))
                    .padding(.bottom)
                
                Button(action: {
                    vm.isLoginViewPresented.toggle()
                }) {
                    Text("Skip")
                        .frame(width: 60, height: 30)
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.4))
                        )
                }
                .offset(x: 140, y: -200)
            }

            VStack(spacing: 8) {
                Text(content)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text("Track your transaction easily, with categories and financial report")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding()
            Spacer()
            PageControl(numberOfPages: 3, currentPage: $vm.selectedTabIndex)
                .padding(.bottom, 40)

            Button(action: {
                if vm.selectedTabIndex < 2 {
                    vm.selectedTabIndex += 1
                } else {
                    vm.isLoginViewPresented.toggle()
                }
            }) {
                Text(vm.selectedTabIndex < 2 ? "Next" : "Get Started")
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(Color.black.opacity(0.9))
                    )
            }
            .padding(.bottom, 4.0)
        }
    }
}

struct Onboarding3: View {
    let imageName: String
    let content: String
    @ObservedObject var vm: OnboardingViewModel
    @State private var isAnimated: Bool = false
    var body: some View {
        VStack {
            ZStack {
                Image(imageName)
                    .scaledToFill()
                    .frame(maxHeight: 420)
                    .frame(minHeight: 250)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.9))
                    .padding(.bottom)
                Button(action: {
                    vm.isLoginViewPresented.toggle()
                    
                }) {
                    Text("Skip")
                        .frame(width: 60, height: 30)
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.4))
                        )
                }
                .offset(x: 140, y: -200)

            }

            VStack(spacing: 8) {
                Text(content)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text("Setup your budget for each category so you are in control")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding()

            Spacer()

            PageControl(numberOfPages: 3, currentPage: $vm.selectedTabIndex)
                .padding(.bottom, 40)
            Button(action: {
                withAnimation(Animation.default) {
                    isAnimated.toggle()
                    if vm.selectedTabIndex < 2 {
                        vm.selectedTabIndex += 1
                    } else {
                        vm.isLoginViewPresented.toggle()
                    }
                }
                
            }) {
                Text(vm.selectedTabIndex < 2 ? "Next" : "Get Started")
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(Color.black.opacity(0.9))
                    )
            }
            .padding(.bottom, 4.0)
        }
    }
}

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { page in
                if page == currentPage {
                    Rectangle()
                        .frame(width: 7, height: 20)
                        .cornerRadius(7)
                        .foregroundColor(.blue)
                } else {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
