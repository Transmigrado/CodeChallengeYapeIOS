//
//  ItemTab.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct ItemTab: View {
    
    var icon: String
    var title: String
    var selected: Bool
    
    var body: some View {
        VStack(spacing:4.0){
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .frame(width: 32.0, height: 32.0)
                .foregroundColor(selected ? Color("Main") : Color("Gray"))
            Text(title)
        }
    }
}

