//
//  HomeView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var recipesManager = RecipesManager()
    
    var body: some View {
        NavigationView {
            List(recipesManager.recipes){_ in
                Text("hola")
            }
            .navigationTitle("Home")
        }
        .onAppear{
            recipesManager.fetch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
