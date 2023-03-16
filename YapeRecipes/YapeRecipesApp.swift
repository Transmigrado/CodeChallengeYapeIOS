//
//  YapeRecipesApp.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI
import Firebase


@main
struct YapeRecipesApp: App {
    
    init() {
       FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
