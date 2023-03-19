//
//  YapeRecipesApp.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI
import Firebase
import Coordinator
import ReSwift
import ReSwiftThunk

@main
struct YapeRecipesApp: App {
    
    @StateObject var coordinator = AppCoordinator()
    
    let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
    let store: AppStore?
   
    init(){
       
        let reducer = combineReducers(
            recipesReducer
        )

        store = AppStore(reducer: reducer, state: AppState(), middleware: [thunkMiddleware])
      
        FirebaseApp.configure()
       
    }
    

    var body: some Scene {
        WindowGroup {
            UserDetectView()
                .environmentObject(store!)
                .coordinator(coordinator)
        }
     
        
    }
}
