//
//  TextField+Styles.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI

struct RoundedTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)           
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 5)
                    .stroke(Color("Gray"), lineWidth: 1)
            )
           
    }
}

struct SearchTextfield: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 10)
            .padding(.horizontal, 24)
            .padding(.leading, 20.0)
            .background(Color("WinterWhite"))
            .cornerRadius(10.0)
            .overlay(
                ZStack{
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(Color("Gray"), lineWidth: 1)
                    Image("icMagnesglass")
                        .position(x: 24.0,y: 20.0)
                }
            )
           
    }
}

