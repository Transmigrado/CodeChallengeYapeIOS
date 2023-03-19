//
//  RecipeCardView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import SDWebImageSwiftUI
import Coordinator

struct RecipeCardView: View {
    
    @Coordinator(for: AppDestination.self) var coordinator
    @EnvironmentObject var store: AppStore
    
    var recipe: Recipe
    
    var body: some View {
        VStack{
            HStack{
                AnimatedImage(url: URL(string: recipe.cover!))
                    .resizable()
                    .frame(width: 120.0, height: 120.0)
                VStack{
                    VStack(alignment: .leading){
                        Text(recipe.name!)
                            .font(.system(size: 14))
                            .bold()
                        Text(recipe.textDescription!)
                            .font(.system(size: 12))
                    }
                    Spacer().frame(height: 10.0)
                    HStack{
                        NumberPropView(icon: "icCal", propName: "Cal", value: "\(recipe.cal ?? 0)")
                        Spacer()
                        NumberPropView(icon: "icTime", propName: "Tiempo", value: "\(recipe.duration ?? 0)")
                        Spacer()
                        NumberPropView(icon: recipe.type!.icon(), propName: "Tipo", value: recipe.type!.label())
                    }
                }
                
                .padding(5.0)
            }
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(radius: 10.0)
        }.padding(10.0)
        .onTapGesture {
            self.store.dispatch(SelectItem<Recipe>(item: recipe))
            coordinator.trigger(.recipeDetail)
        }
}
}
