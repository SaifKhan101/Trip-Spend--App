//
//  TRIP.DETAIL.VIEW.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 25/10/2023.
//

import SwiftUI

struct TripDetail: View {
    @Binding var trip: Trip?
    @Environment(\.presentationMode) var presentationMode
    @State var isShowingSheet              = false
    @State private var selectedTab         = 0
    @State private var searchText          = ""
    @State private var isSearching         = false
    @State private var isEditingExpense    = false
    @State private var editingExpenseIndex = 0
    @Binding var expenses: [ExpenseItem]
    var totalExpenseAmount: Double {
        expenses.reduce(0.0) { $0 + $1.amount }
    }
    let categoryColors: [String: Color] = [
        "Food": Color.green.opacity(0.3),
        "Stay": Color.orange.opacity(0.2),
        "Shopping": Color.blue.opacity(0.3),
        "Debt": Color.red.opacity(0.2),
        "Tips": Color.indigo.opacity(0.3),
        "Travel": Color.purple.opacity(0.3),
        "Ride": Color.yellow.opacity(0.3)
    ]
    func saveEditedExpense(editedExpense: ExpenseItem) {
        guard editingExpenseIndex >= 0 && editingExpenseIndex < expenses.count else {
            return
        }
        expenses[editingExpenseIndex] = editedExpense
    }
    var expenseColors: [Color] {
        return filteredExpenses.map { expense in
            return categoryColors[expense.category] ?? Color.gray
        }
    }
    func calculateTotalAmount() -> String {
        let totalAmountSpent = filteredExpenses.reduce(0.0) { $0 + $1.amount }
        return formatAmount(totalAmountSpent)
    }
    var filteredExpenses: [ExpenseItem] {
        let selectedCategory = CustomTabView.tabItems[selectedTab].name
        return expenses.filter { expense in
            let isMatchingCategory = selectedCategory == "All" || expense.category == selectedCategory
            let isMatchingSearch   = searchText.isEmpty || expense.name.localizedCaseInsensitiveContains(searchText)
            return isMatchingCategory && isMatchingSearch
        }
    }
    private func formatAmount(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: NSNumber(value: amount)) ?? ""
    }
    mutating func addExpense(name: String, amount: String, category: String, date: String) {
        if let amountValue = Double(amount) {
            let categoryImage = getCategorySystemImage(category)
            let newExpense = ExpenseItem(id: UUID(), name: name, image: categoryImage, description: date, category: category, amount: amountValue)
            trip?.expenses.append(newExpense)
        }
    }
    func getCategorySystemImage(_ categoryName: String) -> String {
        switch categoryName {
        case "All":
            return "square.grid.2x2.fill"
        case "Stay":
            return "bed.double.circle"
        case "Shopping":
            return "bag.badge.plus"
        case "Food":
            return "fork.knife"
        case "Debt":
            return "arrow.up.to.line"
        case "Ride":
            return "car"
        case "Tips":
            return "arrow.up.heart"
        case "Travel":
            return "cablecar"
        default:
            return "square.grid.2x2.fill"
        }
    }
    var body: some View {
        ZStack {
            Color.black
                .background(Color.black.ignoresSafeArea(.all))
                .frame(height: 170)
            HStack(alignment: .top) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.white.opacity(0.3))
                        .padding(.leading)
                }
                Spacer()
                Text("\(trip!.tripName)")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.white.opacity(0.3))
                    .padding(.trailing)
            }
            .padding(.bottom, 130)
            VStack(alignment: .center) {
                Text("\(formatAmount(totalExpenseAmount)) Spent")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.red.opacity(0.8))
                    .offset(x: -5, y: -20)
                    .padding()
                Text("Out of $\(trip!.amount) budget")
                    .font(.caption)
                    .foregroundColor(.white)
                    .foregroundColor(.secondary)
                    .offset(x: -10, y: -20)
            }
            .frame(height: 170)
        }
        ZStack {
            Color.white
                .frame(height: 70)
            HStack {
                Text("Expenses")
                    .foregroundColor(.black)
                    .font(.title3)
                    .padding(.leading)
                Spacer()
                Button(action: {
                    isSearching.toggle()
                })  {
                    Image(systemName: searchText.isEmpty ? "magnifyingglass" : "xmark.circle.fill")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .frame(width: 30, height: 30)
                        .background(Color.white.opacity(0.2))
                        .padding(.trailing)
                }
                if isSearching {
                    TextField("Search Expenses", text: $searchText)
                        .padding()
                        .frame(height: 30)
                }
                Button(action: {
                    isShowingSheet = true
                })  {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .frame(width: 30, height: 30)
                        .background(Color.white.opacity(0.2))
                        .padding(.trailing)
                }
                .sheet(isPresented: $isShowingSheet, content: {
                    AddExpanse(isShowingSheet: $isShowingSheet, expenses: $expenses, selectedTrip: trip!)
                })
            }
            .frame(height: 70)
        }
        VStack(spacing: 2) {
            CustomTabView(selectedTab: $selectedTab)
            List {
                ForEach(filteredExpenses.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: filteredExpenses[index].image)
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black.opacity(0.8))
                            .background(expenseColors[index].opacity(0.7))
                            .cornerRadius(9)
                            .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text(filteredExpenses[index].name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            HStack {
                                Text(filteredExpenses[index].description)
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("-\(formatAmount(filteredExpenses[index].amount))")
                                .foregroundColor(.red)
                                .padding(.trailing)
                            Text(filteredExpenses[index].category)
                                .padding(.trailing)
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            expenses.remove(at: index)
                        } label: {
                            Label("Delete", systemImage: "trash.circle.fill")
                        }
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            isEditingExpense = true
                            editingExpenseIndex = index
                        } label: {
                            Label( "Edit", systemImage: "pencil.line")
                        }
                        .tint(Color.blue.opacity(0.3))
                    }
                    .sheet(isPresented: $isEditingExpense) {
                        ExpenseEditView(
                            expense: $expenses[editingExpenseIndex],
                            onSave: { editedExpense in
                                saveEditedExpense(editedExpense: editedExpense)
                            }
                        )
                    }
                }
            }
            .listStyle(.plain)
    }
        Spacer()
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}

//struct YourView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create initial values for trip and expenses
//        let initialTrip = Trip(id: UUID(), tripName: "Your Trip", amount: "1000", startDate: "01/01/2023", expenses: [])
//
//        // Create an array of ExpenseItem as initial expenses
//        let initialExpenses: [ExpenseItem] = []
//
//        return TripDetailView(trip: initialTrip, expenses: initialExpenses)
//    }
//}

//#Preview {
//    TripDetailView(trip: $trip, expenses: $expens)
//}
