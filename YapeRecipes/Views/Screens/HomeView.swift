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

struct HomeView: View {
    
    @Coordinator(for: AppDestination.self) var coordinator
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        NavigationView {
            
            ScrollView{
                ForEach(self.store.state.recipes.list){
                    RecipeCardView(recipe: $0)
                }
            }
            .navigationTitle("Home")
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
