//
//  RecipeCardView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeCardView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack{
            VStack{
                AnimatedImage(url: URL(string: recipe.cover))
                VStack{
                    Text(recipe.name)
                        .bold()
                    Text(recipe.name)
                    HStack{
                        NumberPropView(icon: "icCal", propName: "Cal", value: "\(recipe.cal)")
                        NumberPropView(icon: "icTime", propName: "Tiempo", value: "\(recipe.duration)")
                        NumberPropView(icon: recipe.type.icon(), propName: "Tipo", value: recipe.type.label())
                    }
                }
                .padding(5.0)
            }
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(radius: 10.0)
        }.padding(10.0)
    }
}
