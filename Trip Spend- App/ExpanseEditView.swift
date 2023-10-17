//
//  ExpanseEditView.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 27/10/2023.
//

import Foundation
import SwiftUI

struct ExpenseEditView: View {
    @Binding var expense: ExpenseItem
    @Environment(\.presentationMode) var presentationMode
    var onSave: (ExpenseItem) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Expense")) {
                    TextField("Name", text: $expense.name)
                    TextField("Description", text: $expense.description)
                    TextField("Amount", text: Binding(
                        get: {
                            let formatter = NumberFormatter()
                            formatter.numberStyle = .decimal
                            return formatter.string(from: NSNumber(value: expense.amount)) ?? ""
                        },
                        set: { text in
                            if let newValue = NumberFormatter().number(from: text)?.doubleValue {
                                expense.amount = newValue
                            }
                        }
                    ))

                    HStack {
                        Text("Category")
                        Image(systemName: getSystemImage(for: expense.category))
                    }

                    Picker("Category", selection: $expense.category) {
                        Text("Food").tag("Food")
                        Text("Stay").tag("Stay")
                        Text("Shopping").tag("Shopping")
                        Text("Debt").tag("Debt")
                        Text("Tips").tag("Tips")
                        Text("Travel").tag("Travel")
                        Text("Ride").tag("Ride")
                    }
                }
            }
            .navigationTitle("Edit Expense")
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    },
                trailing:
                    Button("Save") {
                        onSave(expense)
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
    func getSystemImage(for category: String) -> String {
        switch category {
            case "Food":
                return "food-icon"
            case "Stay":
                return "stay-icon"
            case "Shopping":
                return "shopping-icon"
            case "Debt":
                return "debt-icon"
            case "Tips":
                return "tips-icon"
            case "Travel":
                return "travel-icon"
            case "Ride":
                return "ride-icon"
            default:
                return "square.grid.2x2.fill"
        }
    }
}
