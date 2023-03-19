//
//  RecipeDetailView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        Text(self.store.state.recipes.selected?.name ?? "")
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
