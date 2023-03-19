//
//  RecipesReducer.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import ReSwift

func recipesReducer(action: Action, state: AppState?) -> AppState {
   
    var state = state ?? AppState()

    switch action {
        case let data as FetchList<Recipe>:
            state.recipes.list = data.list
        case let item as SelectItem<Recipe>:
            state.recipes.selected = item.item
        default: break
    }
  
    return state
}
