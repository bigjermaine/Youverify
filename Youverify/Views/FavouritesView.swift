//
//  FavouritesView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//



import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var dessertcore: DessertCoredataViewmodel
    @State private var dessertPrices: [Int: Double] = [:]

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(dessertcore.savedEntity.enumerated()), id: \.offset) { index, dessert in
                    VStack(spacing: 10) {
                        HStack {
                            Text("Name 💎")
                            Spacer()
                            Text(dessert.name ?? "")
                        }
                        HStack {
                            Text("Price:")
                            Spacer()
                            Text(String(format: "$%.2f", dessertPrices[index] ?? 0))
                        }
                    }
                    .padding(.vertical, 5)
                }
                .onDelete(perform: dessertcore.delete)
                
                // Row for Total Price
                HStack {
                    Text("Total")
                        .fontWeight(.bold)
                    Spacer()
                    if !dessertcore.savedEntity.isEmpty {
                        Text(String(format: "$%.2f", totalPrice()))
                            .fontWeight(.bold)
                    }
                }
                .padding(.vertical, 10)
                
                // Conditionally show Purchase button if the cart is not empty.
                if !dessertcore.savedEntity.isEmpty {
                    Button(action: {
                        // Add your purchase action code here.
                    }) {
                        Text("Purchase")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(.plain)
            .navigationBarTitle("Cart 🛒")
            .onAppear {
                dessertcore.fetchbooking()
                assignRandomPrices()
                dessertcore.cartCount = 0
            }
        }
    }
    
    // Assign a random price to each dessert item.
    func assignRandomPrices() {
        for index in dessertcore.savedEntity.indices {
            dessertPrices[index] = Double.random(in: 5...50)
        }
    }
    
    func totalPrice() -> Double {
        dessertPrices.values.reduce(0, +)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView().environmentObject(DessertCoredataViewmodel())
    }
}
