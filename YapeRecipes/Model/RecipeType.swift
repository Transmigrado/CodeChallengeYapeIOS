//
//  RecipeType.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation

enum FoodType: String, CaseIterable {
    case dessert = "dessert"
    case mainDish = "main_dish"
    case soup = "soup"
    case coctel = "coctel"
    
    func icon() -> String {
        switch self {
            case .dessert:
                return  "icDessert"
            case .mainDish:
                return  "icMainDish"
            case .soup:
                return  "icSoup"
            case .coctel:
                return  "icCoctel"
        }
    }
    
    func label() -> String {
        switch self {
            case .dessert:
                return  "Postre"
            case .mainDish:
                return  "Principal"
            case .soup:
                return  "Sopa"
            case .coctel:
                return  "Coctel"
        }
    }
 }
