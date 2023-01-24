//
//  DessertsViewModel.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import Foundation
import Combine

protocol DataServiceProtocol{
    func downloadData(url: URL) -> AnyPublisher<MealCategoryModel, Error>
    func downloadDessertData(url: URL) -> AnyPublisher<DessertDetailsModel, Error>
}

class DessertsViewModel: ObservableObject{
    
    @Published var mealsDetailsArray: [CategoryDetails] = []
    @Published var currDessertDetails: DessertDetailsModel = .init(meals: [])
    var cancellables = Set<AnyCancellable>()
    
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol){
        self.dataService = dataService
        getDessertsList()
    }
    
    func getDessertsList() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("invalid url")
            return
        }
        dataService.downloadData(url : url)
            .sink { status in
                print("status sinking: \(status)")
            } receiveValue: { [weak self] returnedMeals in
                self?.mealsDetailsArray = returnedMeals.meals
            }
            .store(in: &cancellables)
    }
    
    
    func getDessertData(mealID: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
            print("invalid url")
            return
        }
        
        dataService.downloadDessertData(url: url)
            .sink { status in
                print("status sinking: \(status)")
            } receiveValue: { [weak self] returnedDessertDetails in
                self?.currDessertDetails = returnedDessertDetails
            }
            .store(in: &cancellables)
    }
}
