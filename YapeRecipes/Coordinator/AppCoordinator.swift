//
//  File.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import SwiftUI
import Coordinator

class AppCoordinator: AppKitOrUIKitWindowCoordinator<AppDestination> {
    override func transition(for route: AppDestination) -> ViewTransition {
        switch route {
            case .main:
                return .present(MainView())
            case .signin:
                return .set(SigninView())
            case .recipeDetail:
                return .push(RecipeDetailView())
        }
    }
}
