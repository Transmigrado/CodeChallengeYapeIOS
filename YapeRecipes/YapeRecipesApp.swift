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
import Swinject

@main
struct YapeRecipesApp: App {
    
    @StateObject private var coordinator: AppCoordinator
    
    let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
    let store: AppStore?
    let container = Container()
   
    init(){
       
        let reducer = combineReducers(
            recipesReducer
        )

        store = AppStore(reducer: reducer, state: AppState(), middleware: [thunkMiddleware])

        let coordinatorWrapped = AppCoordinator(container: container, store: store!)
        self._coordinator = StateObject(wrappedValue: coordinatorWrapped)
        
        container.register(from: .userDetector, value: UserDetectView(container: container))
        container.register(from: .main, value: MainView())
        container.register(from: .signin, value: SigninView())
        container.register(from: .detail, value: RecipeDetailView())
        container.register(from: .addRecipe, value: AddRecipeView())
        
      
        FirebaseApp.configure()
       
    }
    
    var root: some View {
        let view: UserDetectView = container.resolve(from: .userDetector)
        return view.coordinator(coordinator).environmentObject(store!)
    }
    
    var body: some Scene {
        WindowGroup {
            root
        }
    }
}
