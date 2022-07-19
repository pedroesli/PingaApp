//
//  DrinkData.swift
//  PingaApp
//
//  Created by Paulo César on 18/07/22.
//

import Foundation

struct DrinkData: Decodable {
    var drinks: [Drink]
}

struct DrinkLite: Decodable {
    var idDrink: String
    var strDrink: String
    var strDrinkThumb: String
}

struct Drink: Decodable {
    var idDrink: String
    var strDrink: String
    var strCategory: String
    var strAlcoholic: String
    var strGlass: String
    var strInstructions: String
    var strDrinkThumb: String
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    
    func ingredients() -> [String] {
        var ingredients = [String]()
        if let str = strIngredient1  { ingredients.append(str) }
        if let str = strIngredient2  { ingredients.append(str) }
        if let str = strIngredient3  { ingredients.append(str) }
        if let str = strIngredient4  { ingredients.append(str) }
        if let str = strIngredient5  { ingredients.append(str) }
        if let str = strIngredient6  { ingredients.append(str) }
        if let str = strIngredient7  { ingredients.append(str) }
        if let str = strIngredient8  { ingredients.append(str) }
        if let str = strIngredient9  { ingredients.append(str) }
        if let str = strIngredient10 { ingredients.append(str) }
        if let str = strIngredient11 { ingredients.append(str) }
        if let str = strIngredient12 { ingredients.append(str) }
        if let str = strIngredient13 { ingredients.append(str) }
        if let str = strIngredient14 { ingredients.append(str) }
        if let str = strIngredient15 { ingredients.append(str) }
        return ingredients
    }
    
    func measures() -> [String] {
        var measures = [String]()
        if let str = strMeasure1  { measures.append(str) }
        if let str = strMeasure2  { measures.append(str) }
        if let str = strMeasure3  { measures.append(str) }
        if let str = strMeasure4  { measures.append(str) }
        if let str = strMeasure5  { measures.append(str) }
        if let str = strMeasure6  { measures.append(str) }
        if let str = strMeasure7  { measures.append(str) }
        if let str = strMeasure8  { measures.append(str) }
        if let str = strMeasure9  { measures.append(str) }
        if let str = strMeasure10 { measures.append(str) }
        if let str = strMeasure11 { measures.append(str) }
        if let str = strMeasure12 { measures.append(str) }
        if let str = strMeasure13 { measures.append(str) }
        if let str = strMeasure14 { measures.append(str) }
        if let str = strMeasure15 { measures.append(str) }
        return measures
    }
    
    func measuresAndIngredients() -> [String] {
        let ingredients = ingredients()
        let measures = measures()
        var meaAndIng = [String]()
        
        for i in 0..<ingredients.count {
            let ingredient = ingredients[i]
            
            if i < measures.count {
                let measure = measures[i]
                meaAndIng.append("\(measure)\(ingredient)")
            }
            else {
                meaAndIng.append(ingredient)
            }
        }
        
        return meaAndIng
    }
}
