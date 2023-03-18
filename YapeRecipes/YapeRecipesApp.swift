//
//  YapeRecipesApp.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI
import Firebase
import Coordinator

@main
struct YapeRecipesApp: App {
    
    @StateObject var coordinator = AppCoordinator()
    
    init() {
       FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
