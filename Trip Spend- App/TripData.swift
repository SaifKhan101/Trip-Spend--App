//
//  TripData.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 25/10/2023.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Hashable {
        let id: UUID
        var name: String
        var image: String
        var description: String
        var category: String
        var amount: Double
    }

struct Trip: Identifiable, Hashable {
    let id : UUID
    var tripName: String
    var amount: String
    var startDate: String
    var endDate: String?
    var expenses: [ExpenseItem]
    var totalExpenses: Double {
            return expenses.reduce(0) { $0 + $1.amount }
        }
    var status: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        if let tripEndDate = dateFormatter.date(from: self.endDate ?? ""),
           tripEndDate < Date() {
            return "Ended"
        } else {
            return "Ongoing"
        }
    }
}
