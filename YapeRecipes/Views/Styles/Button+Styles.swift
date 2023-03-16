//
//  Button+Styles.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI

struct Rounded: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                .padding(.horizontal, 10.0)
                .padding(.vertical, 8.0)
                .background(Color("Main"))
                .clipShape(Capsule(style: .continuous))
                .shadow(color: Color("Shadow"), radius: 4, x: 0, y: 5)
    }
}


