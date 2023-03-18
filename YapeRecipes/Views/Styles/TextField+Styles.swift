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


