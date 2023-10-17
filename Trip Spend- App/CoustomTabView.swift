//
//  CoustomTabView.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 26/10/2023.
//

import Foundation
import SwiftUI

struct TabItem {
    let name: String
    let imageName: String
}

struct CustomTabView: View {
    @Binding var selectedTab: Int
    
   static let tabItems: [TabItem] = [
        TabItem(name: "All", imageName: ""),
        TabItem(name: "Stay", imageName: "bed.double.circle"),
        TabItem(name: "Shopping", imageName: "bag.badge.plus"),
        TabItem(name: "Food", imageName: "fork.knife"),
        TabItem(name: "Debt", imageName: "arrow.up.to.line"),
        TabItem(name: "Ride", imageName: "car"),
        TabItem(name: "Tips", imageName: "arrow.up.heart"),
        TabItem(name: "Travel", imageName: "cablecar"),
    ]
    
    static func systemImage(forTab tab: Int) -> String {
            return tabItems[tab].imageName
        }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<CustomTabView.tabItems.count) { index in
                    Button(action: {
                        selectedTab = index
                    }) {
                        HStack() {
                            Image(systemName: CustomTabView.tabItems[index].imageName)
                                .frame(width: 25, height: 20)
                                .foregroundColor(selectedTab == index ? Color.red.opacity(0.4) : .black)
                            Text(CustomTabView.tabItems[index].name)
                                .foregroundColor(selectedTab == index ? Color.red.opacity(0.4) : .black)
                        }
                        .padding()
                        .background(selectedTab == index ? Color.red.opacity(0.3) : Color.black.opacity(0.1))
                        .frame(height: 25)
                        .cornerRadius(9)
                    }
                }
            }
        }
    }
}
