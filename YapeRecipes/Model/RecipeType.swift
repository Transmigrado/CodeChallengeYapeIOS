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
    
    func icon() -> String {
        switch self {
            case .dessert:
                return  "icDessert"
            case .mainDish:
                return  "icDessert"
            case .soup:
                return  "icSoup"
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
        }
    }
 }
