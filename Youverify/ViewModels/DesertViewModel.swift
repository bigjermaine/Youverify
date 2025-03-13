//
//  DesertViewModel.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//

import Foundation
import Combine
import SwiftUI



class DessertViewModel: ObservableObject {
    @Published var searchtext: String = ""
    @Published var meals: [Meal] = []
    @Published var mealsDetails: [MealDetail] = []
    
    init() {
        fetch()
    }
    
    /// Fetching desserts data from the API and injecting it into the ViewModel using APIService.
    private func fetch() {
        APIService.shared.fetchData(from: APIService.Constants.baseDessertsURL) { [weak self] (result: Result<MealModel, APIService.APIError>) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let mealModel):
                    self.meals = mealModel.meals.sorted { $0.strMeal < $1.strMeal }
                case .failure(let error):
                    print("Error fetching desserts: \(error)")
                }
            }
        }
    }
    
    /// Fetching dessert details based on ID using APIService.
    public func fetchDetails(id: String) {
        let urlString = "\(APIService.Constants.dessertDetailsURL)\(id)"
        APIService.shared.fetchData(from: urlString) { [weak self] (result: Result<MealData, APIService.APIError>) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let mealData):
                    self.mealsDetails = mealData.meals
                    print("Fetched details: \(mealData.meals)")
                case .failure(let error):
                    print("Error fetching details: \(error)")
                }
            }
        }
    }
}
