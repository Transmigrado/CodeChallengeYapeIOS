//
//  HomeView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import Coordinator
import ReSwift
import ReSwiftThunk
import SwiftUI_FAB

struct HomeView: View {
    
    @Coordinator(for: AppDestination.self) var coordinator
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        NavigationView {
            
            ZStack{
                ScrollView{
                    ForEach(self.store.state.recipes.list){
                        RecipeCardView(recipe: $0)
                    }
                }
                .floatingActionButton(color: Color("Main"), image: Image(systemName: "plus").foregroundColor(.white)) {
                    coordinator.trigger(.addRecipe)
                }
                .navigationTitle("Recetas")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear{
            self.store.dispatch(fetchThunk())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
