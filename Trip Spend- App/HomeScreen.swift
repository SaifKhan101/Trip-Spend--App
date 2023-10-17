//
//  HomeView.swift
//  Trip Spend- App
//
//  Created by SAIF ALI KHAN on 18/10/2023.
//

import SwiftUI

struct HomeView: View {
    @State var trips: [Trip] = []
    @State private var selectedTrip: Trip?
    @State private var showTripDetail = false
    @State private var searchText                 = ""
    @State private var isSearching                = false
    @State private var selectedTripIndex: Int?
    var totalExpenses: Double {
        var sum: Double = 0.0
        for trip in trips {
            sum += trip.expenses.reduce(0) { $0 + $1.amount }
        }
        return sum
    }
    let newTrip = Trip(id: UUID(), tripName: "New Trip", amount: "1000", startDate: "10/01/2023", endDate: nil, expenses: [])
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black.opacity(1)
                    .ignoresSafeArea()
                VStack {
                    HStack() {
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.secondary)
                            .cornerRadius(9)
                            .padding([.top, .leading], 20.0)
                        VStack(alignment: .leading, spacing: 0){
                            Text("Name")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding([.top], 10.0)
                            Text("Welcome to TripSpend")
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        NavigationLink {
                            withAnimation(Animation.smooth) {
                                TripScreen(trips: $trips)
                            }
                            
                        } label: {
                            Text("New Trip")
                                .frame(width: 110, height: 35)
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(30)
                                .foregroundColor(.black)
                                .padding(.horizontal, 7)
                        }
                    }
                    .padding(.vertical)
                    VStack {
                        HStack(spacing: 30) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 150, height: 100)
                                    .foregroundColor(Color.white.opacity(0.2))
                                    .cornerRadius(12)
                                VStack(alignment: .leading,spacing: 4) {
                                    Image(systemName: "dot.square.fill")
                                        .foregroundColor(Color.white.opacity(0.7))
                                        .frame(width: 25, height: 20)
                                        .aspectRatio(contentMode: .fill)
                                        .background(Color.white.opacity(0.4))
                                        .cornerRadius(4)
                                    Text("Spent overall")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                    Text("\(totalExpenses, specifier: "%.2f")")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 30)
                            }
                            ZStack {
                                Rectangle()
                                    .frame(width: 150, height: 100)
                                    .foregroundColor(Color.white.opacity(0.2))
                                    .cornerRadius(12)
                                VStack(alignment: .leading, spacing: 4) {
                                    Image(systemName: "airplane")
                                        .rotationEffect(.degrees(-90))
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 20)
                                        .aspectRatio(contentMode: .fill)
                                        .background(Color.white.opacity(0.4))
                                        .cornerRadius(4)
                                    Text("Trips")
                                        .font(.caption)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                    Text("\(trips.count)")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 80)
                            }
                        }
                        HStack(spacing: 30) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 150, height: 100)
                                    .foregroundColor(Color.white.opacity(0.2))
                                    .cornerRadius(12)
                                VStack(alignment: .leading, spacing: 4) {
                                    Image(systemName: "arrow.up.to.line")
                                        .renderingMode(.original)
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 20)
                                        .aspectRatio(contentMode: .fill)
                                        .background(Color.white.opacity(0.4))
                                        .cornerRadius(4)
                                    Text("Total Dept")
                                        .font(.caption)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                    Text("$0.00")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 30)
                            }
                            ZStack {
                                Rectangle()
                                    .frame(width: 150, height: 100)
                                    .foregroundColor(Color.white.opacity(0.2))
                                    .cornerRadius(12)
                                VStack(alignment: .leading, spacing: 4) {
                                    Image(systemName: "arrow.down.to.line")
                                        .renderingMode(.original)
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 20)
                                        .aspectRatio(contentMode: .fill)
                                        .background(Color.white.opacity(0.4))
                                        .cornerRadius(4)
                                    Text("Total Owed")
                                        .font(.caption)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                    Text("$0.00")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 30)
                            }
                        }
                        Spacer()
                    }
                }
            }
            if trips.isEmpty {
                VStack {
                    Image("contentContainer")
                        .foregroundColor(.white)
                        .background(.white)
                        
                    NavigationLink {
                        TripScreen( trips: $trips)
                    } label: {
                        Text("Start a new trip")
                            .frame(width: 280, height: 50)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .fill(Color.black.opacity(0.9))
                            )
                                                }
                    .padding(.top, 25)
                }
                Spacer()
                Spacer()
                Spacer()
            } else {
                VStack(spacing: 1) {
                    ZStack {
                        Color.white
                            .frame(height: 70)
                        HStack {
                            Text("My Trips")
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding(.horizontal)
                            Spacer()
                            if !isSearching {
                                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                            }
                            Button(action: {
                                isSearching.toggle()
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                            }
                            if isSearching {
                                TextField("Search Trips", text: $searchText)
                                    .padding()
                                    .padding(.horizontal)
                                    .background(Color.white.opacity(0.2))
                                    .padding(.trailing)
                            }
                        }
                    }
                    
                    List {
                        ForEach(trips.indices,  id: \.self) { index in
                            let trip = trips[index]
                            VStack(alignment: .leading, spacing: 0) {
                                if !isSearching || searchText.isEmpty || trip.tripName.localizedCaseInsensitiveContains(searchText) {
                                    Button(action: {
                                        selectedTrip = trip
                                        selectedTripIndex = index
                                        showTripDetail = true
                                    })
                                    {
                                        HStack {
                                            Rectangle()
                                                .frame(width: 50, height: 50)
                                                .aspectRatio(contentMode: .fill)
                                                .foregroundColor(Color.gray.opacity(0.4))
                                                .cornerRadius(9)
                                                .padding(.horizontal)
                                            VStack(alignment: .leading) {
                                                Text(trip.tripName)
                                                    .foregroundColor(.black)
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                HStack {
                                                    Text("Spent: $\(trip.totalExpenses, specifier: "%.2f")")
                                                        .font(.caption)
                                                        .foregroundColor(.black)
                                                    Text("Status: \(trip.status)")
                                                        .foregroundColor(trip.status == "Ongoing" ? Color.green : Color.black )
                                                        .font(.caption)
                                                }
                                            }
                                            Spacer()
                                            Image(systemName: "arrow.forward.circle.fill")
                                                .foregroundColor(.black)
                                                .padding(.trailing)
                                                .onTapGesture {
                                                    selectedTrip = trip
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.bottom)
                    .background(
                        NavigationLink(
                            destination: TripDetail(trip: $selectedTrip, expenses: selectedTripIndex != nil ? $trips[selectedTripIndex!].expenses : .constant([])),
                            isActive: $showTripDetail
                        ) {
                            EmptyView()
                        }
                    )
                }
//                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}
