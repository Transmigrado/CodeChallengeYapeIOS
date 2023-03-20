//
//  Button+Styles.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI

struct Rounded: ButtonStyle {
    
    var color: Color
    
    init(color: Color){
        self.color = color;
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                
                
                .frame(maxWidth: .infinity)
                .frame(height: 30.0)
                .padding(.horizontal, 10.0)
                .padding(.vertical, 12.0)
                .background(color)
                .clipShape(Capsule(style: .continuous))
                .shadow(color: Color("LightShadow"), x: 0, y: 5, blur: 20)
    }
}



struct GradientBackgroundStyle: ButtonStyle {

    let firstColor: Color
    let secondColor: Color

    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [firstColor, secondColor]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
    }
}
