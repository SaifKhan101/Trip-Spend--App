//
//  TripDetailView.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 20/10/2023.
//

import SwiftUI


//struct TripDetailView: View {
//    
//    var trip: Trip
//    init(trip: Trip, expenses: Binding<[ExpenseItem]>) {
//            self.trip = trip
//            self._expenses = expenses
//        }
//    @EnvironmentObject var tripManager: TripManager
//    @Environment(\.presentationMode) var presentationMode
//    @State var isShowingSheet = false
//    @State private var selectedTab = 0
//    @State private var searchText = ""
//    @State private var isSearching = false
//   
//    let categoryColors: [String: Color] = [
//        "Food": Color.green.opacity(0.3),
//        "Stay": Color.orange.opacity(0.2),
//        "Shopping": Color.blue.opacity(0.3),
//        "Debt": Color.red.opacity(0.2),
//        "Tips": Color.indigo.opacity(0.3),
//        "Travel": Color.purple.opacity(0.3),
//        "Ride": Color.yellow.opacity(0.3)
//       
//    ]
//
//    var expenseColors: [Color] {
//        return filteredExpenses.map { expense in
//            return categoryColors[expense.category] ?? Color.gray
//        }
//    }
//
//      @Binding  var expenses: [ExpenseItem]
//
//    func calculateTotalAmount() -> String {
//        let totalAmountSpent = filteredExpenses.reduce(0.0) { $0 + $1.amount }
//        return formatAmount(totalAmountSpent)
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
//
//    private func formatAmount(_ amount: Double) -> String {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.currencySymbol = "$"
//        return formatter.string(from: NSNumber(value: amount)) ?? ""
//    }
//
//    mutating func addExpense(name: String, amount: String, category: String, date: String) {
//        if let amountValue = Double(amount) {
//            let categoryImage = getCategorySystemImage(category)
//            let newExpense = ExpenseItem(id: UUID(), name: name, image: categoryImage, description: date, category: category, amount: amountValue)
//            trip.expenses.append(newExpense)
//        }
//    }
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
//    var body: some View {
////        VStack(spacing: 8) {
//            ZStack {
//                Color.black
//                    .background(Color.black.ignoresSafeArea(.all))
//                    .frame(height: 170)
//                HStack(alignment: .top) {
//                    Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }) {
//                            Image(systemName: "chevron.backward")
//                                .foregroundColor(.white)
//                                .frame(width: 30, height: 30)
//                                .background(Color.white.opacity(0.3))
//                                .padding(.leading)
//                        }
//                    Spacer()
//                    Text("\(trip.tripName)")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    Spacer()
//                    Image(systemName: "ellipsis")
//                        .rotationEffect(.degrees(90))
//                        .foregroundColor(.white)
//                        .frame(width: 30, height: 30)
//                        .background(Color.white.opacity(0.3))
//                        .padding(.trailing)
//                }
//                .padding(.bottom, 130)
//                VStack(alignment: .center) {
//                    Text("\(ExpenseItem.totalAmount(for: expenses), specifier: "$%.2f") spent")
//                        .font(.title)
//                        .fontWeight(.black)
//                        .foregroundColor(Color.red.opacity(0.8))
//                        .offset(x: -5, y: -20)
//                        .padding()
//                    Text("Out of $\(trip.amount) budget")
//                        .font(.caption)
//                        .foregroundColor(.white)
//                        .foregroundColor(.secondary)
//                        .offset(x: -10, y: -20)
//                }
//                .frame(height: 170)
//            }
//            ZStack {
//                Color.white
//                    .frame(height: 70)
//                HStack {
//                    Text("Expenses")
//                        .foregroundColor(.black)
//                        .font(.title3)
//                        .padding(.leading)
//                    Spacer()
//                    Button(action: {
//                        isSearching.toggle()
//                    })  {
//                        Image(systemName: searchText.isEmpty ? "magnifyingglass" : "xmark.circle.fill")
//                            .foregroundColor(.black)
//                            .padding(.horizontal)
//                            .frame(width: 30, height: 30)
//                            .background(Color.white.opacity(0.2))
//                            .border(.secondary)
//                            .padding(.trailing)
//                    }
//                    if isSearching {
//                        TextField("Search Expenses", text: $searchText)
//                            .padding()
//                            .frame(height: 30)
//                    }
//
//                    Button(action: {
//                        isShowingSheet = true
//                    })  {
//                        Image(systemName: "plus")
//                            .foregroundColor(.black)
//                            .padding(.horizontal)
//                            .frame(width: 30, height: 30)
//                            .background(Color.white.opacity(0.2))
//                            .border(.secondary)
//                            .padding(.trailing)
//                    }
//                    .sheet(isPresented: $isShowingSheet, content: {
//                        AddExpanse(isShowingSheet: $isShowingSheet, selectedTrip: trip )
//                    })
//                    
//                    
//                }
//                .frame(height: 70)
//            }
//            CustomTabView(selectedTab: $selectedTab)
//            
//            ScrollView {
//                VStack(spacing: 0) {
//                    ForEach(filteredExpenses.indices, id: \.self) { index in
//                        Border(height: 90) {
//                            HStack {
//                                Image(systemName: filteredExpenses[index].image)
//                                    .frame(width: 50, height: 50)
//                                    .aspectRatio(contentMode: .fit)
//                                    .foregroundColor(.black.opacity(0.8))
//                                    .background(expenseColors[index].opacity(0.7))
//                                    .cornerRadius(9)
//                                    .padding(.horizontal)
//                                VStack(alignment: .leading) {
//                                    Text(filteredExpenses[index].name)
//                                        .font(.title3)
//                                        .fontWeight(.semibold)
//                                    HStack {
//                                        
//                                        Text(filteredExpenses[index].description)
//                                    }
//                                }
//                                Spacer()
//                                    
//                                VStack(alignment: .trailing) {
//                                    
//                                    Text(formatAmount(filteredExpenses[index].amount))
//                                        .padding(.trailing)
//                                    Text(filteredExpenses[index].category)
//                                        .padding(.trailing)
//                                }
//
//                            }
//                        }
//                        .swipeActions(allowsFullSwipe: true) {
//                            Button(role: .destructive) {
//                                        // Delete the expense
//                                        expenses.remove(at: index)
//                                    } label: {
//                                        Label("Delete", systemImage: "trash.circle.fill")
//                                    }
//                        }
//                    }
//                }
//            }
//            
//            Spacer()
//                .navigationTitle("")
//                .navigationBarHidden(true)
//                
////        }
//    }
//}

//#Preview {
//    TripDetailView(trip: Trip(
//        id: UUID(),
//        tripName: "Sample Trip",
//        amount: "1000",
//        startDate: "01/01/2023",
//        endDate: "01/15/2023", expenses: []
//    ), expenses: [])
//}





//struct AddExpanse: View {
//    @State private var name = ""
//    @State private var amount = ""
//    @State private var category = "All"
//    @State var  isCategoryPickerVisible = false
//    @State private var selectedEndDate = Date()
//    @State private var isEndDatePickerVisible = false
//    @Binding var isShowingSheet: Bool
//    @State var expenses: [ExpenseItem] = []
//    var selectedTrip: Trip
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
//
//    private func formatDateTime(_ date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
//        return dateFormatter.string(from: date)
//    }
//
//    private func parseDateTime(_ string: String) -> Date? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
//        return dateFormatter.date(from: string)
//    }
//
//    var categories = ["All", "Stay", "Shopping", "Food", "Debt", "Ride", "Tips", "Travel"]
//
//    var body: some View {
//        HStack {
//            Text("Add Expense")
//                .font(.title)
//                .padding()
//            Spacer()
//            Button(action: {
//                isShowingSheet.toggle()
//            }) {
//                Image(systemName: "multiply")
//                    .foregroundColor(.black)
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.3))
//                    )
//                    .padding()
//            }
//        }
//        VStack(alignment: .leading) {
//            Text("Name")
//                .padding(.horizontal)
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray)
//                    .frame(height: 50)
//                    .padding()
//                TextField("Where did you spend", text: $name)
//                    .padding(.horizontal, 20)
//                    .padding(.leading)
//            }
//            Text("Amount")
//                .padding(.horizontal)
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray)
//                    .frame(height: 50)
//                    .padding()
//                TextField("Enter spent amount", text: $amount)
//                    .padding(.horizontal)
//                    .padding(.leading)
//            }
//            Text("Category")
//                            .padding(.horizontal)
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.gray)
//                                .frame(height: 50)
//                                .padding()
//                            
//                            HStack {
//                                if category != "All" {
//                                    Label(
//                                        title: {
//                                            Text(category)
//                                                .foregroundColor(.black)
//                                                .padding(.horizontal)
//                                        },
//                                        icon: {
//                                            Image(systemName: getCategorySystemImage(category))
//                                        }
//                                    )
//                                }
//                                Spacer()
//                                
//                                Button(action: {
//                                    isCategoryPickerVisible.toggle()
//                                }) {
//                                    Image(systemName: "chevron.down")
//                                        .padding(.trailing, 10)
//                                        .foregroundColor(.gray)
//                                        .padding(.trailing)
//                                }
//                            }
//                        }
//                        .onTapGesture {
//                            isCategoryPickerVisible.toggle()
//                        }
//                        if isCategoryPickerVisible {
//                            Picker("Select Expense Category", selection: $category) {
//                                ForEach(categories, id: \.self) { categoryName in
//                                    Label(
//                                        title: {
//                                            Text(categoryName)
//                                        },
//                                        icon: {
//                                            Image(systemName: getCategorySystemImage(categoryName))
//                                        }
//                                    )
//                                    .padding(.horizontal)
//                                }
//                            }
//                            .pickerStyle(MenuPickerStyle())
//                            .padding(.horizontal)
//                        }
//            Text("Expense Date & Time")
//                .padding(.horizontal)
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray)
//                    .frame(height: 50)
//                    .padding()
//                HStack {
//                    TextField("Select Date & Time", text: Binding(
//                        get: { formatDateTime($selectedEndDate.wrappedValue) },
//                            set: { newValue in
//                                if let date = parseDateTime(newValue) {
//                                    $selectedEndDate.wrappedValue = date
//                                }
//                            }
//                        ))
//                    .padding(.horizontal)
//                    .padding(.leading)
//
//                    Button(action: {
//                        isEndDatePickerVisible.toggle()
//                    }) {
//                        Image(systemName: "calendar")
//                            .padding(.trailing, 10)
//                            .foregroundColor(.gray)
//                            .padding(.trailing)
//                    }
//                }
//            }
//            .sheet(isPresented: $isEndDatePickerVisible) {
//                DatePicker("Expense Date & Time", selection: $selectedEndDate, in: .distantPast...Date().addingTimeInterval(31536000), displayedComponents: [.date, .hourAndMinute])
//                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .labelsHidden()
//                    .onChange(of: selectedEndDate) { newDate in
//                       
//                        selectedEndDate = newDate
//                }
//            }
//        }
//        Spacer()
//        Button(action: {
//            if let amountValue = Double(amount) {
//                    let newExpense = ExpenseItem(
//                        id: UUID(), name: name,
//                        image: getCategorySystemImage(category),
//                        description: formatDateTime(selectedEndDate),
//                        category: category,
//                        amount: amountValue
//                    )
//                    expenses.append(newExpense)
//                    isShowingSheet.toggle()
//                } else {
//                    // Handle invalid input (e.g., non-numeric input)
//                }
//        }) {
//            Text("Add Expense")
//                .frame(width: 280, height: 50)
//                .foregroundColor(.white)
//                .background(
//                    Capsule()
//                        .fill(Color.black.opacity(0.9))
//                )
//        }
//    }
//}



//struct AddExpanse: View {
//    @State private var name = ""
//    @State private var amount = ""
//    @State private var category = ""
//    @State private var endDate                  = ""
//    @Binding var isShowingSheet: Bool
//    @State private var selectedEndDate          = Date()
//    @State private var isEndDatePickerVisible   = false
//   private func formatDate(_ date: Date) -> String {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM/dd/yyyy"
//            return dateFormatter.string(from: date)
//        }
//    var body: some View {
//        HStack {
//            Text("Add Expense")
//                .font(.title)
//                .padding()
//            Spacer()
//            Button(action: {
//                isShowingSheet.toggle()
//            }){
//                Image(systemName: "multiply")
//                    .foregroundColor(.black)
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(.white)
//                    .background(
//                        Capsule()
//                            .fill(Color.black.opacity(0.3))
//                    )
//                    .padding()
//            }
//            
//        }
//        VStack(alignment: .leading) {
//            Text("Name")
//                .padding(.horizontal)
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray)
//                    .frame( height: 50)
//                    .padding()
//                TextField("Where did you spend", text: $name)
//                    .padding(.horizontal,20)
//                    .padding(.leading)
//            }
//            Text("Amount")
//                .padding(.horizontal)
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray)
//                    .frame(height: 50)
//                    .padding()
//                TextField("Enter spent amount", text: $amount)
//                    .padding(.horizontal)
//                    .padding(.leading)
//            }
//            Text("Categery")
//                .padding(.horizontal)
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray)
//                    .frame(height: 50)
//                    .padding()
//                HStack {
//                    TextField("Select Expanse Category", text: $category)
//                        .padding(.horizontal)
//                        .padding(.leading)
//                    Button(action: {
////                        isEndDatePickerVisible.toggle()
//                    }) {
//                        Image(systemName: "chevron.down")
//                            .padding(.trailing, 10)
//                            .foregroundColor(.gray)
//                            .padding(.trailing)
//                    }
//                }
//            }
//            
//            Text("Expense Date")
//                .padding(.horizontal)
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray)
//                    .frame(height: 50)
//                    .padding()
//                HStack {
//                    TextField("Select Date", text: $endDate)
//                        .padding(.horizontal)
//                        .padding(.leading)
//                    Button(action: {
//                        isEndDatePickerVisible.toggle()
//                    }) {
//                        Image(systemName: "calendar")
//                            .padding(.trailing, 10)
//                            .foregroundColor(.gray)
//                            .padding(.trailing)
//                    }
//                }
//            }
//            .sheet(isPresented: $isEndDatePickerVisible) {
//                            DatePicker("Expanse Date", selection: $selectedEndDate, in: .distantPast...Date().addingTimeInterval(31536000))
//                                .datePickerStyle(GraphicalDatePickerStyle())
//                                .labelsHidden()
//                                .onChange(of: selectedEndDate) { newDate in
//                                    endDate = formatDate(newDate)
//                                }
//                        }
//        }
//        Spacer()
//        Button(action: {
//            
//        }) {
//            Text("Add Expense")
//                .frame(width: 280, height: 50)
//                .foregroundColor(.white)
//                .background(
//                    Capsule()
//                        .fill(Color.black.opacity(0.9))
//                )
//        }
//    }
//}
//extension String {
//  var toDate: Date {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy"
//        return dateFormatter.date(from: self) ?? Date()
//    }
//}
