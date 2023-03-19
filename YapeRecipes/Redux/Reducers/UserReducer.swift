//
//  UserReducer.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//


import Foundation
import ReSwift

func userReducer(action: Action, state: AppState?) -> AppState {
   
    var state = state ?? AppState()

    switch action {
        case let item as SelectItem<User>:
            state.userProfile.currentUser = item.item
        default: break
    }
  
    return state
}

