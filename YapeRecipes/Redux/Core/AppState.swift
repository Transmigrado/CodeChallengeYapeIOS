//
//  AppState.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//


import Foundation
import ReSwift
import SwiftUI

struct AppState: Equatable {

    var stateStatus = UUID()
    var recipes = Recipes()
    var userProfile = UserProfile()
}

//MARK: RECIPES
struct Recipes: Identifiable, Equatable {
    static func == (lhs: Recipes, rhs: Recipes) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var list: [Recipe] = []
    var selected: Recipe?
}

//MARK: USER
struct UserProfile: Identifiable,Equatable{
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.id == rhs.id
    }
    var id = UUID()
    var currentUser: User?
}
