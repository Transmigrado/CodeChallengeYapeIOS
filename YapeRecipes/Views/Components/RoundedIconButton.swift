//
//  RoundedIconButton.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct RoundedIconButton: View {
    
    var icon: String
    var propName: String
    var normalColor: Color
    var selectedColor: Color
    @State var selected = false
    
    var body: some View {
        
        Button {
            selected.toggle()
        } label: {
            ZStack{
                NumberPropView(icon: icon, propName: propName)
            }
            .padding(5.0)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selected ? selectedColor : normalColor, lineWidth: selected ? 2 : 1)
            )
        }

      
   
    }
}

