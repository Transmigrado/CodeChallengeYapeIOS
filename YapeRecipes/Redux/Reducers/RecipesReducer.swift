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
        default: break
    }
  
    return state
}
