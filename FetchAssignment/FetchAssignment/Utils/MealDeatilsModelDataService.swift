//
//  MealDeatilsModelDataService.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import Foundation
import Combine


class MealDeatilsModelDataService: DataServiceProtocol{
    
    //static let instance = MealDeatilsModelDataService()
    
    
    //@Published var mealDetails: [CategoryDetails] = []
    //@Published var dessertDetails: DessertDetailsModel = .init(meals: [])
    
    //var cancellables = Set<AnyCancellable>()
    
    func downloadData(url: URL) -> AnyPublisher<MealCategoryModel, Error> {

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: MealCategoryModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        /*
            .sink { (completion) in
                switch completion{
                case.finished:
                    print("sinked finished: \(completion)")
                    break
                case.failure(let error):
                    print("sinked failure: \(error)")
                }
            } receiveValue: { [weak self] (returnedMealDetails) in
                self?.mealDetails = returnedMealDetails.meals.sorted(by: { $0.strMeal.compare($1.strMeal, options: .caseInsensitive) == .orderedAscending})
            }
            .store(in: &cancellables)
         */
    }
    
    func downloadDessertData(url: URL) -> AnyPublisher<DessertDetailsModel,Error> {
  
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: DessertDetailsModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        /*
            .sink { (completion) in
                switch completion{
                case.finished:
                    print("sinked finished: \(completion)")
                    break
                case.failure(let error):
                    print("sinked failure: \(error)")
                }
            } receiveValue: { [weak self] (res) in
                print(res)
                self?.dessertDetails = res
            }
            .store(in: &cancellables)
         */
        
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else{
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}
