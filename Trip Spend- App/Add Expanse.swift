//
//  Add Expanse.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 25/10/2023.
//

import SwiftUI

struct AddExpanse: View {
    @State private var name                   = ""
    @State private var amount                 = ""
    @State private var category               = "All"
    @State var  isCategoryPickerVisible       = false
    @State private var selectedEndDate        = Date()
    @State private var isEndDatePickerVisible = false
    @Binding var isShowingSheet: Bool
    @Binding var expenses: [ExpenseItem]
    var selectedTrip: Trip
        
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
    
    private func formatDateTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
    private func parseDateTime(_ string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        return dateFormatter.date(from: string)
    }
    
    var categories = ["All", "Stay", "Shopping", "Food", "Debt", "Ride", "Tips", "Travel"]
    
    var body: some View {
        HStack {
            Text("Add Expense")
                .font(.title)
                .padding()
            Spacer()
            Button(action: {
                isShowingSheet.toggle()
            }) {
                Image(systemName: "multiply")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(Color.black.opacity(0.3))
                    )
                    .padding()
            }
        }
        VStack(alignment: .leading) {
            Text("Name")
                .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
                    .frame(height: 50)
                    .padding()
                TextField("Where did you spend", text: $name)
                    .padding(.horizontal, 20)
                    .padding(.leading)
            }
            Text("Amount")
                .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
                    .frame(height: 50)
                    .padding()
                TextField("Enter spent amount", text: $amount)
                    .padding(.horizontal)
                    .padding(.leading)
            }
            Text("Category")
                .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
                    .frame(height: 50)
                    .padding()
                
                HStack {
                    if category != "All" {
                        Label(
                            title: {
                                Text(category)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                            },
                            icon: {
                                Image(systemName: getCategorySystemImage(category))
                                    .padding(.leading)
                                    .padding(.horizontal)
                            }
                        )
                    }
                    Spacer()
                    
                    Button(action: {
                        isCategoryPickerVisible.toggle()
                    }) {
                        Image(systemName: "chevron.down")
                            .padding(.trailing, 10)
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                }
            }
            .onTapGesture {
                isCategoryPickerVisible.toggle()
            }
            if isCategoryPickerVisible {
                Picker("Select Expense Category", selection: $category) {
                    ForEach(categories, id: \.self) { categoryName in
                        Label(
                            title: {
                                Text(categoryName)
                            },
                            icon: {
                                Image(systemName: getCategorySystemImage(categoryName))
                                    .padding(.leading)
                                    .padding(.horizontal)
                            }
                        )
                        .padding(.horizontal)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
            }
            Text("Expense Date & Time")
                .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
                    .frame(height: 50)
                    .padding()
                HStack {
                    TextField("Select Date & Time", text: Binding(
                        get: { formatDateTime($selectedEndDate.wrappedValue) },
                        set: { newValue in
                            if let date = parseDateTime(newValue) {
                                $selectedEndDate.wrappedValue = date
                            }
                        }
                    ))
                    .padding(.horizontal)
                    .padding(.leading)
                    
                    Button(action: {
                        isEndDatePickerVisible.toggle()
                    }) {
                        Image(systemName: "calendar")
                            .padding(.trailing, 10)
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                }
            }
            .sheet(isPresented: $isEndDatePickerVisible) {
                DatePicker("Expense Date & Time", selection: $selectedEndDate, in: .distantPast...Date().addingTimeInterval(31536000), displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .onChange(of: selectedEndDate) { newDate in
                        selectedEndDate = newDate
                }
            }
        }
        Spacer()
        Button(action: {
            if let amountValue = Double(amount) {
                let categoryImage = getCategorySystemImage(category)
                let newExpense = ExpenseItem(id: UUID(), name: name, image: categoryImage, description: formatDateTime(selectedEndDate), category: category, amount: amountValue)
                expenses.append(newExpense)
                isShowingSheet.toggle()
            } else {
                
            }
        }) {
            Text("Add Expense")
                .frame(width: 280, height: 50)
                .foregroundColor(.white)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.9))
                )
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


//#Preview {
//    AddExpanse(isShowingSheet: , selectedTrip: <#Trip#>)
//}
