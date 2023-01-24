//
//  MealDeatilsModelDataService.swift
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

class MealDataService: DataServiceProtocol{

    func downloadData(url: URL) -> AnyPublisher<MealCategoryModel, Error> {

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: MealCategoryModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func downloadDessertData(url: URL) -> AnyPublisher<DessertDetailsModel,Error> {

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: DessertDetailsModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else{
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
} 
