//
//  DessertsViewModel_Tests.swift
//  FetchAssignment_Tests
//
//  Created by Sai Jannali on 1/24/23.
//

import XCTest
@testable import FetchAssignment
import Combine

class MockDataService: DataServiceProtocol{
    func downloadData(url: URL) -> AnyPublisher<FetchAssignment.MealCategoryModel, Error> {
        let mealCategory: MealCategoryModel = MealCategoryModel(meals: [CategoryDetails(strMeal: "testMeal", strMealThumb: "testThumbURL", idMeal: "0")])
        
        return Just<MealCategoryModel>(mealCategory)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func downloadDessertData(url: URL) -> AnyPublisher<FetchAssignment.DessertDetailsModel, Error> {
        let dessertDetails: DessertDetailsModel = DessertDetailsModel(meals: [DessertDetails(idMeal: "0", strMeal: "testMeal", strDrinkAlternate: "", strCategory: "Desserts", strArea: "", strInstructions: "", strMealThumb: "testThumbURL", strTags: "", strYoutube: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "", strImageSource: "", strCreativeCommonsConfirmed: "", dateModified: "")])
        
        return Just<DessertDetailsModel>(dessertDetails)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}

final class DessertsViewModel_Tests: XCTestCase {
    var vm: DessertsViewModel?
    

    override func setUpWithError() throws {
        vm = DessertsViewModel(dataService: MockDataService())
    }

    override func tearDownWithError() throws {
        vm = nil
    }

    func test_DessertsViewModel_dataService_shouldExist(){
        //Given
        guard let vm = vm else{
            XCTFail()
            return
        }
        
        //Then
        XCTAssertNotNil(vm.dataService)
    }
    
    func test_DessertsViewModel_mealsDetailsArray_shouldContainOneItem(){
        //Given
        guard let vm = vm else{
            XCTFail()
            return
        }
        
        //Then
        XCTAssertEqual(vm.mealsDetailsArray.count, 1)
    }
    
    func test_DessertsViewModel_mealsDetailsArray_shouldPopulateCorrectData(){
        //Given
        guard let vm = vm else{
            XCTFail()
            return
        }
        
        
        //Then
        XCTAssertNil(vm.currDessertDetails.meals.first?.idMeal)
    }
    
    func test_DessertsViewModel_currDessertDetails_shouldNotPopulate(){
        //Given
        guard let vm = vm else{
            XCTFail()
            return
        }
        
        //Then
        XCTAssertNil(vm.currDessertDetails.meals.first?.idMeal)
    }
    
    func test_DessertsViewModel_getDessertsList_shouldPopulate(){
        //Given
        guard let vm = vm else{
            XCTFail()
            return
        }
        
        //When
        if vm.mealsDetailsArray.count > 0{
            vm.mealsDetailsArray = []
        }
        vm.getDessertsList()
        
        //Then
        XCTAssertEqual(vm.mealsDetailsArray.count, 1)
    }
    
    func test_DessertsViewModel_getDessertData_shouldPopulate(){
        //Given
        guard let vm = vm else{
            XCTFail()
            return
        }
        
        //When
        vm.getDessertData(mealID: "0")
        
        //Then
        XCTAssertEqual(vm.currDessertDetails.meals.first?.idMeal, "0")
    }

}
