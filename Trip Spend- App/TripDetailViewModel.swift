//
//  TripDetailViewModel.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 26/10/2023.
//

import Foundation
import SwiftUI

//class TripDetailViewModel: ObservableObject {
//    @Published var trip: Trip
//    @Published var expenses: [ExpenseItem]
//    @Published var searchText = ""
//    @Published var selectedTab = 0
//    init(trip: Trip, expenses: [ExpenseItem]) {
//            self.trip = trip
//            self.expenses = expenses
//        }
//   
//    func calculateTotalAmount() -> String {
//        let totalAmountSpent = filteredExpenses.reduce(0.0) { $0 + $1.amount }
//        return formatAmount(totalAmountSpent)
//    }
//    func formatAmount(_ amount: Double) -> String {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.currencySymbol = "$"
//        return formatter.string(from: NSNumber(value: amount)) ?? ""
//    }
//    var filteredExpenses: [ExpenseItem] {
//        let selectedCategory = CustomTabView.tabItems[selectedTab].name
//        return expenses.filter { expense in
//            let isMatchingCategory = selectedCategory == "All" || expense.category == selectedCategory
//            let isMatchingSearch = searchText.isEmpty || expense.name.localizedCaseInsensitiveContains(searchText)
//            
//            return isMatchingCategory && isMatchingSearch
//        }
//    }
//    func addExpense(name: String, amount: String, category: String, date: String) {
//        if let amountValue = Double(amount) {
//            let categoryImage = getCategorySystemImage(category)
//            let newExpense = ExpenseItem(id: UUID(), name: name, image: categoryImage, description: date, category: category, amount: amountValue)
//            trip.expenses.append(newExpense)
//        }
//    }
//    var expenseColors: [Color] {
//            return filteredExpenses.map { expense in
//                return categoryColors[expense.category] ?? Color.gray
//            }
//        }
//    let categoryColors: [String: Color] = [
//        "Food": Color.green.opacity(0.3),
//        "Stay": Color.orange.opacity(0.2),
//        "Shopping": Color.blue.opacity(0.3),
//        "Debt": Color.red.opacity(0.2),
//        "Tips": Color.indigo.opacity(0.3),
//        "Travel": Color.purple.opacity(0.3),
//        "Ride": Color.yellow.opacity(0.3)
//    ]
//    
//    func getCategorySystemImage(_ categoryName: String) -> String {
//        switch categoryName {
//        case "All":
//            return "square.grid.2x2.fill"
//        case "Stay":
//            return "bed.double.circle"
//        case "Shopping":
//            return "bag.badge.plus"
//        case "Food":
//            return "fork.knife"
//        case "Debt":
//            return "arrow.up.to.line"
//        case "Ride":
//            return "car"
//        case "Tips":
//            return "arrow.up.heart"
//        case "Travel":
//            return "cablecar"
//        default:
//            return "square.grid.2x2.fill"
//        }
//    }
//}
