//
//  ImageCardView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct ImageCardView: View {
    var body: some View {
        HStack{
            Image("imgPresentation")
        }
        .frame(maxWidth: .infinity )
        .frame( height: 300.0)
        .background(Color("Main"))
        .cornerRadius(40.0)
        .shadow(color: Color("Main"), x: 0.0, y: 4.0, blur:10.0)
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView()
    }
}
