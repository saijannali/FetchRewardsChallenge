//
//  MealDataService_Tests.swift
//  FetchAssignment_Tests
//
//  Created by Sai Jannali on 1/23/23.
//

import XCTest
import Combine
@testable import FetchAssignment

final class MealDataService_Tests: XCTestCase {
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        cancellables = []
    }

    override func tearDownWithError() throws {
    }
    
    func test_MealDataService_downloadData_shouldReturnItems() {
        //Given
        let dataService = MealDataService()
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        let expectation = XCTestExpectation(description: "Should return items from internet")
        var res: MealCategoryModel?
        
        //When
        dataService.downloadData(url: url)
            .sink(receiveCompletion: { _ in
                expectation.fulfill()
            }, receiveValue: { returnedRes in
                res = returnedRes
            })
            .store(in: &cancellables)
        
        //Then
        wait(for: [expectation] , timeout: 5)
        XCTAssertNotNil(res)
    }
    
    func test_MealDataService_downloadDessertData_shouldReturnItems() {
        //Given
        let dataService = MealDataService()
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=53049")!
        let expectation = XCTestExpectation(description: "Should return Dessert Details")
        var res: DessertDetailsModel?
        
        //when
        dataService.downloadDessertData(url: url)
            .sink { _ in
                expectation.fulfill()
            } receiveValue: { returnedRes in
                res = returnedRes
            }
            .store(in: &cancellables)
        
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(res)
    }

}
