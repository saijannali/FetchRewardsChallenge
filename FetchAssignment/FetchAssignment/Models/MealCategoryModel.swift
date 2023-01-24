//
//  MealCategoryModel.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import Foundation

struct MealCategoryModel: Codable{
    let meals: [CategoryDetails]
}

struct CategoryDetails: Identifiable, Codable{
    var id: String {idMeal}
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}


