//
//  ButtonView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button(action: {  }) {
            Text("Sign in")
                .bold()
                .foregroundColor(Color.white)
        }
        .buttonStyle(Rounded())
       
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
