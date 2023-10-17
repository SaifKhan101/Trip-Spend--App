//
//  duplicate file.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 17/10/2023.
//

import Foundation
//struct OnboardingView: View {
//    @State private var selectedTabIndex = 0
//
//    var body: some View {
//        NavigationView {
//            TabView(selection: $selectedTabIndex) {
//                OnboardingScreen(imageName: "step1Image", content: "You ought to know where your money goes")
//                    .tag(0)
//                OnboardingScreen(imageName: "step2Image", content: """
//                                 Gain total control
//                                 of your money
//                                 """)
//                    .tag(1)
//                OnboardingScreen(imageName: "step3Image", content: "Plan ahead and manage your money better")
//                    .tag(2)
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//        }
//        
//        .ignoresSafeArea()
//        .navigationTitle("")
//        .navigationBarHidden(true)
//    }
//}
//
//struct OnboardingScreen: View {
//    let imageName: String
//    let content: String
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Image(imageName)
//                    .ignoresSafeArea()
////                    .scaledToFill()
//                    .frame(height: 450)
//                    .frame(minHeight: 350)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.black.opacity(0.7))
//                    .padding(.bottom)
//                    
//                NavigationLink(destination: LogIn_View()) {
//                    Text("Skip")
//                        .frame(width: 60, height: 30)
//                        .foregroundColor(.white)
//                        .background(
//                            Capsule()
//                                .fill(Color.black.opacity(0.4))
//                        )
//                }
//                .offset(x: 140, y: -200)
//            }
//
//            VStack(spacing: 8) {
//                Text(content)
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.center)
//                Text("Get an overview of how you are performing and motivate yourself to achieve more")
//                    .font(.subheadline)
//                    .multilineTextAlignment(.center)
//            }
//            .padding()
//
//            Spacer()
//
//            NavigationLink(destination: Onboarding2()) {
//                Text("Next")
//                    .frame(width: 250, height: 50)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.9))
//                    )
//            }
//            .padding(.bottom, 4.0)
//        }
//    }
//}
//
//struct Onboarding2: View {
//    var body: some View {
//        VStack {
//        ZStack {
//            Image("step2Image")
//                .scaledToFill()
//                .frame(height: 450)
//                .frame(minHeight: 350)
//                .frame(maxWidth: .infinity)
//                .background(Color.black.opacity(0.7))
//                .padding(.bottom)
//            NavigationLink(destination: LogIn_View()) {
//                Text("Skip")
//                    .frame(width: 60, height: 30)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.4))
//                    )
//                    
//            }
//            .offset(x: 140, y: -200)
//        }
//        
//        VStack(spacing: 8) {
//            Text("""
//Gain total control
//of your money
//""")
//                .font(.title)
//                .fontWeight(.semibold)
//                .multilineTextAlignment(.center)
//            Text("Track your transaction easily, with categories and finencal report")
//                .font(.subheadline)
//                .multilineTextAlignment(.center)
//        }
//        .padding()
//        Spacer()
//        
//        
//            NavigationLink(destination: Onboarding3()) {
//                Text("Next")
//                    .frame(width: 250, height: 50)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.9))
//                    )
//            }
//        }
//        .navigationTitle("")
//        .navigationBarHidden(true)
//    }
//}
//
//struct Onboarding3: View {
//    var body: some View {
//        VStack {
//          ZStack {
//            Image("step3Image")
//                .scaledToFill()
//                .frame(height: 450)
//                .frame(minHeight: 350)
//                .frame(maxWidth: .infinity)
//                .background(Color.black.opacity(0.7))
//                .padding(.bottom)
//              NavigationLink(destination: LogIn_View()) {
//                  Text("Skip")
//                      .frame(width: 60, height: 30)
//                      .foregroundColor(.white)
//                      .background(
//                          Capsule()
//                              .fill(Color.black.opacity(0.4))
//                      )
//                      
//              }
//              .offset(x: 140, y: -200)
//        }
//        
//        VStack(spacing: 8) {
//            Text("Plan ahead and manage your money better")
//                .font(.title)
//                .fontWeight(.semibold)
//                .multilineTextAlignment(.center)
//            Text("Setup your budget for each catogery so you are in control")
//                .font(.subheadline)
//                .multilineTextAlignment(.center)
//        }
//        .padding()
//        Spacer()
//        
//            
//        
//            NavigationLink(destination: LogIn_View()) {
//                Text("Get Started")
//                    .frame(width: 250, height: 50)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.9))
//                    )
//            }
//        }
//        .navigationTitle("")
//        .navigationBarHidden(true)
//    }
//}
//
//struct PageControl: View {
//    var numberOfPages: Int
//    @Binding var currentPage: Int
//
//    var body: some View {
//        HStack {
//            ForEach(0..<numberOfPages, id: \.self) { page in
//                Circle()
//                    .frame(width: 8, height: 8)
//                    .foregroundColor(page == currentPage ? .blue : .gray)
//            }
//        }
//    }
//}









//struct OnboardingView: View {
//    @State private var selectedTabIndex = 0
//    var body: some View {
//        NavigationView {
//            VStack {
//                ZStack {
//                    Image("step1Image")
//                        .scaledToFill()
//                        .frame(maxHeight: 420)
//                        .frame(minHeight: 250)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black.opacity(0.9))
//                        .padding(.bottom)
//                    
//                    NavigationLink(destination: LogIn_View()) {
//                        Text("Skip")
//                            .frame(width: 60, height: 30)
//                            .foregroundColor(.white)
//                            .background(
//                                Capsule()
//                                    .fill(Color.black.opacity(0.3))
//                            )
//                    }
//                    .offset(x: 140, y: -200)
//                }
//                
//                
//                VStack(spacing: 8) {
//                    Text("You ought to know where your money goes")
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .multilineTextAlignment(.center)
//                    Text("Get an overview of how you are performing and motivate your self to achive more")
//                        .font(.subheadline)
//                        .multilineTextAlignment(.center)
//                }
//                .padding(.horizontal)
//                Spacer()
//                
//                //                .padding()
//                NavigationLink(destination: Onboarding2()) {
//                    Text("Next")
//                        .frame(width: 250, height: 50)
//                        .foregroundColor(.white)
//                        .background(
//                            Capsule()
//                                .fill(Color.black.opacity(0.9))
//                        )
//                }
//                .padding(.bottom)
//            }
//            
//        }
//        .navigationTitle("")
//        .navigationBarHidden(true)
//        
//    }
//}
//
//struct Onboarding2: View {
//    var body: some View {
//        VStack {
//            ZStack {
//                Image("step2Image")
//                    .scaledToFill()
//                    .frame(maxHeight: 420)
//                    .frame(minHeight: 250)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.black.opacity(0.9))
//                    .padding(.bottom)
//                NavigationLink(destination: LogIn_View()) {
//                    Text("Skip")
//                        .frame(width: 60, height: 30)
//                        .foregroundColor(.white)
//                        .background(
//                            Capsule()
//                                .fill(Color.black.opacity(0.4))
//                        )
//                    
//                }
//                .offset(x: 140, y: -200)
//            }
//
//            VStack(spacing: 8) {
//                Text("""
//Gain total control
//of your money
//""")
//                .font(.title)
//                .fontWeight(.semibold)
//                .multilineTextAlignment(.center)
//                Text("Track your transaction easily, with categories and finencal report")
//                    .font(.subheadline)
//                    .multilineTextAlignment(.center)
//            }
//            .padding(.horizontal)
//            Spacer()
//            
//            
//            NavigationLink(destination: Onboarding3()) {
//                Text("Next")
//                    .frame(width: 250, height: 50)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.9))
//                    )
//            }
//            .padding(.bottom)
//        }
//        .navigationTitle("")
//        .navigationBarHidden(true)
//    }
//}
//
//struct Onboarding3: View {
//    var body: some View {
//        VStack {
//            ZStack {
//                Image("step3Image")
//                    .scaledToFill()
//                    .frame(maxHeight: 420)
//                    .frame(minHeight: 250)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.black.opacity(0.9))
//                    .padding(.bottom)
//                NavigationLink(destination: LogIn_View()) {
//                    Text("Skip")
//                        .frame(width: 60, height: 30)
//                        .foregroundColor(.white)
//                        .background(
//                            Capsule()
//                                .fill(Color.black.opacity(0.4))
//                        )
//                    
//                }
//                .offset(x: 140, y: -200)
//            }
//            
//            VStack(spacing: 8) {
//                Text("Plan ahead and manage your money better")
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.center)
//                Text("Setup your budget for each catogery so you are in control")
//                    .font(.subheadline)
//                    .multilineTextAlignment(.center)
//            }
//            .padding(.horizontal)
//            Spacer()
//            
//            
//            
//            NavigationLink(destination: LogIn_View()) {
//                Text("Get Started")
//                    .frame(width: 250, height: 50)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.9))
//                    )
//            }
//            .padding(.bottom)
//            
//        }
//        .navigationTitle("")
//        .navigationBarHidden(true)
//    }
//}
//
//struct PageControl: View {
//    var numberOfPages: Int
//    @Binding var currentPage: Int
//    
//    var body: some View {
//        HStack {
//            ForEach(0..<numberOfPages, id: \.self) { page in
//                Circle()
//                    .frame(width: 8, height: 8)
//                    .foregroundColor(page == currentPage ? .blue : .gray)
//            }
//        }
//    }
//}









//struct OnboardingScaeen: View {
//    @State private var selectedTabIndex = 0
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TabView(selection: $selectedTabIndex,
//                        content:  {
//                    OnboardingView()
//                        .tag(0)
//                    Onboarding2()
//                        .tag(1)
//                    Onboarding3()
//                        .tag(2)
//                })
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .ignoresSafeArea(edges: .top)
////                .edgesIgnoringSafeArea(.top)
//
//                PageControl(numberOfPages: 3, currentPage: $selectedTabIndex)
//                Spacer()
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}













//struct OnboardingView: View {
//    @State private var selectedTabIndex = 0
//
//    var body: some View {
//        NavigationView { // Wrap the TabView in a NavigationView
//            VStack {
//                TabView(selection: $selectedTabIndex) {
//                    // Your OnboardingScreens here...
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .ignoresSafeArea(edges: .all)
//                
//                NavigationLink(destination: getNextOnboardingScreen(), isActive: $selectedTabIndex.isNextTabActive) {
//                    EmptyView()
//                }
//            }
//        }
//    }
//
//    func getNextOnboardingScreen() -> some View {
//        switch selectedTabIndex {
//        case 0:
//            return Onboarding2(imageName: "step2Image", content: "Gain Control of your money", selectedTabIndex: $selectedTabIndex)
//        case 1:
//            return Onboarding3(imageName: "step3Image", content: "Plan ahead and manage your money better", selectedTabIndex: $selectedTabIndex)
//        default:
//            return Text("Last Screen") // Customize this for your last screen
//        }
//    }
//}
//
//extension Binding where Value == Int {
//    var isNextTabActive: Binding<Bool> {
//        Binding(
//            get: { self.wrappedValue != 0 },
//            set: { _ in self.wrappedValue = 1 }
//        )
//    }
//}
//struct OnboardingView: View {
//    @State private var selectedTabIndex = 0
//    @State private var isloginViewPresented = false
//
//    var body: some View {
//        TabView(selection: $selectedTabIndex) {
//            OnboardingScreen(imageName: "step1Image", content: "You ought to know where your money goes")
//                .tag(0)
//            Onboarding2(imageName: "step2Image", content: "Gain Control of your money")
//                .tag(1)
//            Onboarding3(imageName: "step3Image", content: "Plan ahead and manage your money better")
//                .tag(2)
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .ignoresSafeArea(edges: .all)
//        .fullScreenCover(isPresented: $isloginViewPresented) {
//            LogIn_View()
//        }
//    }
//}
//
//struct OnboardingScreen: View {
//    let imageName: String
//    let content: String
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                ZStack {
//                    Image(imageName)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(maxHeight: 420)
//                        .frame(minHeight: 250)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black.opacity(0.9))
//                        .padding(.bottom)
//
//                    Button(action: {
//                        isloginViewPresented.toggle()
//                    }) {
//                        Text("Skip")
//                            .frame(width: 60, height: 30)
//                            .foregroundColor(.white)
//                            .background(
//                                Capsule()
//                                    .fill(Color.black.opacity(0.4))
//                            )
//                    }
//                    .offset(x: geometry.size.width / 2 - 40, y: -200)
//                }
//
//                VStack(spacing: 8) {
//                    Text(content)
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .multilineTextAlignment(.center)
//                    Text("Get an overview of how you are performing and motivate yourself to achieve more")
//                        .font(.subheadline)
//                        .multilineTextAlignment(.center)
//                }
//                .padding()
//
//                Spacer()
//
//                PageControl(numberOfPages: 3, currentPage: $selectedTabIndex)
//                    .padding(.bottom, 40)
//
//                Button(action: {
//                    if selectedTabIndex < 2 {
//                        selectedTabIndex += 1
//                    } else {
//                        isloginViewPresented.toggle()
//                    }
//                }) {
//                    Text(selectedTabIndex < 2 ? "Next" : "Get Started")
//                        .frame(width: 250, height: 50)
//                        .foregroundColor(.white)
//                        .background(
//                            Capsule()
//                                .fill(Color.black.opacity(0.9))
//                        )
//                }
//                .padding(.bottom, 4.0)
//            }
//        }
//    }
//}

// Onboarding2 and Onboarding3 are similar to OnboardingScreen with their own content
//struct Onboarding2: View {
//    let imageName: String
//    let content: String
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                ZStack {
//                    Image(imageName)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(maxHeight: 420)
//                        .frame(minHeight: 250)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black.opacity(0.9))
//                        .padding(.bottom)
//
//                    Button(action: {
//                        isloginViewPresented.toggle()
//                    }) {
//                        Text("Skip")
//                            .frame(width: 60, height: 30)
//                            .foregroundColor(.white)
//                            .background(
//                                Capsule()
//                                    .fill(Color.black.opacity(0.4))
//                            )
//                    }
//                    .offset(x: geometry.size.width / 2 - 40, y: -200)
//                }
//
//                VStack(spacing: 8) {
//                    Text(content)
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .multilineTextAlignment(.center)
//                    Text("Track your transactions easily, with categories and financial reports")
//                        .font(.subheadline)
//                        .multilineTextAlignment(.center)
//                }
//                .padding()
//
//                Spacer()
//
//                PageControl(numberOfPages: 3, currentPage: $selectedTabIndex)
//                    .padding(.bottom, 40)
//
//                Button(action: {
//                    if selectedTabIndex < 2 {
//                        selectedTabIndex += 1
//                    } else {
//                        isloginViewPresented.toggle()
//                    }
//                }) {
//                    Text(selectedTabIndex < 2 ? "Next" : "Get Started")
//                        .frame(width: 250, height: 50)
//                        .foregroundColor(.white)
//                        .background(
//                            Capsule()
//                                .fill(Color.black.opacity(0.9))
//                        )
//                }
//                .padding(.bottom, 4.0)
//            }
//        }
//    }
//}
//
//struct Onboarding3: View {
//    let imageName: String
//    let content: String
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                ZStack {
//                    Image(imageName)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(maxHeight: 420)
//                        .frame(minHeight: 250)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black.opacity(0.9))
//                        .padding(.bottom)
//
//                    Button(action: {
//                        isloginViewPresented.toggle()
//                    }) {
//                        Text("Skip")
//                            .frame(width: 60, height: 30)
//                            .foregroundColor(.white)
//                            .background(
//                                Capsule()
//                                    .fill(Color.black.opacity(0.4))
//                            )
//                    }
//                    .offset(x: geometry.size.width / 2 - 40, y: -200)
//                }
//
//                VStack(spacing: 8) {
//                    Text(content)
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .multilineTextAlignment(.center)
//                    Text("Set up your budget for each category so you are in control")
//                        .font(.subheadline)
//                        .multilineTextAlignment(.center)
//                }
//                .padding()
//
//                Spacer()
//
//                PageControl(numberOfPages: 3, currentPage: $selectedTabIndex)
//                    .padding(.vertical, 40)
//
//                Button(action: {
//                    if selectedTabIndex < 2 {
//                        selectedTabIndex += 1
//                    } else {
//                        isloginViewPresented.toggle()
//                    }
//                }) {
//                    Text(selectedTabIndex < 2 ? "Next" : "Get Started")
//                        .frame(width: 250, height: 50)
//                        .foregroundColor(.white)
//                        .background(
//                            Capsule()
//                                .fill(Color.black.opacity(0.9))
//                        )
//                }
//                .padding(.bottom, 4.0)
//            }
//        }
//    }
//}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        let tripManager = TripManager()
//        tripManager.trips.append(Trip(id: UUID(), tripName: "Sample Trip", amount: "1000", startDate: "01/01/2023", endDate: "01/15/2023"))
//
//        return HomeView()
//            .environmentObject(tripManager)
//    }
//}
//    = [
//        ExpenseItem(name: "Bills", image: "fork.knife", description: "4:30PM - 23 Oct-2023", category: "Food", amount: 455.0),
//        ExpenseItem(name: "Hotel", image: "bed.double", description: "2:00PM - 23 Oct-2023", category: "Stay", amount: 677.0),
//        ExpenseItem(name: "Shopping", image: "bag.badge.plus", description: "5:00PM - 23 Oct-2023", category: "Shopping", amount: 344.0),
//        ExpenseItem(name: "Debt", image: "arrow.up.to.line", description: "5:00PM - 23 Oct-2023", category: "Debt", amount: 15.0),
//        ExpenseItem(name: "Extra tip", image: "arrow.up.heart", description: "5:00PM - 23 Oct-2023", category: "Tips", amount: 7.0)
//        ]
//else {
//    VStack {
//        Image("contentContainer")
//            .foregroundColor(.white)
//            .background(.white)
//        
//        NavigationLink {
//            TripScreen()
//        } label: {
//            Text("Start a new trip")
//                .frame(width: 280, height: 50)
//                .foregroundColor(.white)
//                .background(
//                    Capsule()
//                        .fill(Color.black.opacity(0.9))
//                )
//        }
//        .padding(.top, 20.0)
//    }
//}
