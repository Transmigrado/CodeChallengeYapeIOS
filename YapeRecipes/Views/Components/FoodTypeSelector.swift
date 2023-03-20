//
//  FoodTypeSelector.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct FoodTypeSelector: View {
    var body: some View {
        HStack{
            RoundedIconButton(icon: "icDessert", propName: "Postre", normalColor: Color("Main"), selectedColor: Color("Selected"))
            Spacer()
            RoundedIconButton(icon: "icSoup", propName: "Sopa", normalColor: Color("Main"), selectedColor: Color("Selected"))
            Spacer()
            RoundedIconButton(icon: "icMainDish", propName: "Principal", normalColor: Color("Main"), selectedColor: Color("Selected"))
            Spacer()
            RoundedIconButton(icon: "icCoctel", propName: "Coctel", normalColor: Color("Main"), selectedColor: Color("Selected"))
        }
        .padding(.horizontal, 10.0)
    }
}

struct FoodTypeSelector_Previews: PreviewProvider {
    static var previews: some View {
        FoodTypeSelector()
    }
}
