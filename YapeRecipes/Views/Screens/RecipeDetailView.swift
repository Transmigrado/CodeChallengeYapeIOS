//
//  RecipeDetailView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailView: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        VStack{
            AnimatedImage(url: URL(string: self.store.state.recipes.selected!.cover!))
                .resizable()
                .frame(height: 200.0)
 
            Text(self.store.state.recipes.selected?.name ?? "")
            Spacer()
        }
        .frame(alignment: .top)

        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
