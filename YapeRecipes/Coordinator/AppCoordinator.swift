//
//  File.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import SwiftUI
import Coordinator
import Swinject

class AppCoordinator: AppKitOrUIKitWindowCoordinator<AppDestination> {
    
    var container: Container
    var store: AppStore
    
    init(container: Container, store: AppStore){
        self.container = container
        self.store = store
    }
    
    override func transition(for route: AppDestination) -> ViewTransition {
        switch route {
            case .main:
                let mainView: MainView = container.resolve(from : .main)
                return .present(mainView)
            case .signin:
                let signinView: SigninView = container.resolve(from : .signin)
            return .set(signinView.environmentObject(store))
            case .recipeDetail:
                return .push(RecipeDetailView())
            case .addRecipe:
                return .push(AddRecipeView())
        }
    }
}
