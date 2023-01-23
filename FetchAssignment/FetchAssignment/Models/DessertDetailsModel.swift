//
//  DessertDetailsModel.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import Foundation

struct DessertDetailsModel: Codable {
    let meals: [DessertDetails]
}

struct DessertDetails: Codable{
    let idMeal: String?
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    var strIngredients: [String] {
        var ingredients: [String?] = []
        ingredients.append(strIngredient1)
        ingredients.append(strIngredient2)
        ingredients.append(strIngredient3)
        ingredients.append(strIngredient4)
        ingredients.append(strIngredient5)
        ingredients.append(strIngredient6)
        ingredients.append(strIngredient7)
        ingredients.append(strIngredient8)
        ingredients.append(strIngredient9)
        ingredients.append(strIngredient10)
        ingredients.append(strIngredient11)
        ingredients.append(strIngredient12)
        ingredients.append(strIngredient13)
        ingredients.append(strIngredient14)
        ingredients.append(strIngredient15)
        ingredients.append(strIngredient16)
        ingredients.append(strIngredient17)
        ingredients.append(strIngredient18)
        ingredients.append(strIngredient19)
        ingredients.append(strIngredient20)
        
        return ingredients.compactMap( { $0 } ).filter( {!$0.isEmpty } )
    }
    
    var strMeasures: [String] {
        var measures: [String?] = []
        measures.append(strMeasure1)
        measures.append(strMeasure2)
        measures.append(strMeasure3)
        measures.append(strMeasure4)
        measures.append(strMeasure5)
        measures.append(strMeasure6)
        measures.append(strMeasure7)
        measures.append(strMeasure8)
        measures.append(strMeasure9)
        measures.append(strMeasure10)
        measures.append(strMeasure11)
        measures.append(strMeasure12)
        measures.append(strMeasure13)
        measures.append(strMeasure14)
        measures.append(strMeasure15)
        measures.append(strMeasure16)
        measures.append(strMeasure17)
        measures.append(strMeasure18)
        measures.append(strMeasure19)
        measures.append(strMeasure20)
        
        return measures.compactMap( { $0 })
    }
    
    
    
}
