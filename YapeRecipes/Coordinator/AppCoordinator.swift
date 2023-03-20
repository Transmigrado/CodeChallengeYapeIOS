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
                return .set(mainView.environmentObject(store))
            case .signin:
                let signinView: SigninView = container.resolve(from : .signin)
                return .set(signinView.environmentObject(store))
            case .recipeDetail:
                let detailView: RecipeDetailView = container.resolve(from : .detail)
                return .push(detailView)
            case .addRecipe:
                let addRecipeView: AddRecipeView = container.resolve(from : .addRecipe)
                return .push(addRecipeView)
            case .search:
                let searchView: SearchView = container.resolve(from : .search)
                return .present(searchView.environmentObject(store))
            case .signinWithEmail:
                let signinWithEmailView: SigninWithEmailView = container.resolve(from : .signinWithEmail)
                return .present(signinWithEmailView.environmentObject(store))
            case .signup:
                let signupView: SignupView = container.resolve(from : .signup)
                return .present(signupView.environmentObject(store))
        }
    }
}
