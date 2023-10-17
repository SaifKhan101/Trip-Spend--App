//
//  TripModel.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 19/10/2023.
//

import SwiftUI

struct TripModel: View {
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .blur(radius: 50)
                ZStack{
                    Color.white
                        .frame(width: 300, height: 370)
                        .cornerRadius(15)
                    
                    NavigationLink {
                        HomeView()
                    } label: {
                        Image(systemName: "multiply")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .fill(Color.black.opacity(0.3))
                            )
                    }
                    .offset(x: 120, y: -160)
                    VStack(alignment: .center, spacing: 6) {
                        Image("Image 1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 120)
                            .padding(.bottom)
                        Text("OverSpend no more")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Get ready to start using the budget for traveling")
                            .font(.subheadline)
                            .frame(width: 200)
                            .lineLimit(2)
                        NavigationLink {
                            HomeView()
                        } label: {
                            Text("Let's  start")
                                .frame(width: 260, height: 50)
                                .foregroundColor(.white)
                                .background(
                                    Capsule()
                                        .fill(Color.black.opacity(0.9))
                                )
                        }
                        .padding(.vertical, 20.0)
//                    }
                }
            }
        }
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}

#Preview {
    TripModel()
}
