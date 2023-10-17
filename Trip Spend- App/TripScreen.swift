//
//  Trip.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 19/10/2023.
//

import SwiftUI

struct TripScreen: View {
    @State private var tripName                 = ""
    @State private var amount                   = ""
    @State private var startDate                = ""
    @State private var endDate                  = ""
    @State private var selectedStartDate        = Date()
    @State private var selectedEndDate          = Date()
    @State private var isStartDatePickerVisible = false
    @State private var isEndDatePickerVisible   = false
    @Environment(\.presentationMode) var presentation
    @Binding var trips: [Trip]
    @State var shouldReturnToHome = false
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
    
    private func parseDate(_ string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: string)
    }

    var body: some View {
        VStack {
            ZStack {
                Color.black.opacity(0.9)
                    .ignoresSafeArea()
                    .frame(height: 110)
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            presentation.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        Text("Start a new trip")
                            .padding(.horizontal)
                            .font(.title)
                            .foregroundColor(.white)
                        
                    }
                    Text("About time you start managing your finances")
                        .padding(.horizontal)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom)
            VStack(alignment: .leading, spacing: 1){
                Text("Trip Name")
                    .padding(.horizontal)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                        .frame( height: 50)
                        .padding()
                    TextField("Where are you going", text: $tripName)
                        .padding(.horizontal,20)
                        .padding(.leading)
                }
                Text("Budget")
                    .padding(.horizontal)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                        .frame(height: 50)
                        .padding()
                    TextField("Enter amount", text: $amount)
                        .padding(.horizontal)
                        .padding(.leading)
                }
                Text("Start Date")
                    .padding(.horizontal)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                        .frame(height: 50)
                        .padding()
                    HStack {
                        TextField("Select Date", text: Binding(
                                    get: { formatDate($selectedEndDate.wrappedValue) },
                                    set: { newValue in
                                        if let date = parseDate(newValue) {
                                            $selectedEndDate.wrappedValue = date
                                        }
                                    }
                                ))
                            .padding(.horizontal)
                            .padding(.leading)
                        Button(action: {
                            isStartDatePickerVisible.toggle()
                        }) {
                            Image(systemName: "calendar")
                                .padding(.trailing, 10)
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                    }
                }
                Text("End Date (Optional)")
                    .padding(.horizontal)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                        .frame(height: 50)
                        .padding()
                    HStack {
                        TextField("Select Date", text: Binding(
                            get: { formatDate(selectedEndDate) },
                            set: { newValue in
                                if let date = parseDate(newValue) {
                                    selectedEndDate = date
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
                Spacer()
            }
            .sheet(isPresented: $isStartDatePickerVisible) {
                DatePicker("Select Start Date", selection: $selectedStartDate, in: .distantPast...Date(), displayedComponents: .date)

                    
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .onChange(of: selectedStartDate) { newDate in
                        startDate = formatDate(newDate)
                    }
            }
            .sheet(isPresented: $isEndDatePickerVisible) {
                DatePicker("Select End Date", selection: $selectedEndDate, in: .distantPast...Date().addingTimeInterval(31536000), displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .onChange(of: selectedEndDate) { newDate in
                        endDate = formatDate(newDate)
                }
            }
            
            NavigationLink(destination: HomeView(), isActive: $shouldReturnToHome) {
                EmptyView()
            }
            .buttonStyle(PlainButtonStyle())
            Button(action: {
                let trip = Trip(id: UUID(), tripName: tripName, amount: amount, startDate: startDate, endDate: endDate, expenses: [])
                               trips.append(trip)                               
                               presentation.wrappedValue.dismiss()
            }) {
                Text("start Trip")
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(Color.black.opacity(0.9))
                    )
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

extension String {
    var toDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: self) ?? Date()
    }
}

//#Preview {
//    TripScreen()
//}
