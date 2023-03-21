//
//  SimpleHeaderView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 21-03-23.
//

import SwiftUI

struct SimpleHeaderView: View {
    
    var title: String
    
    var body: some View {
        
        HStack{
            BackButton()
            Spacer()
            Text(title)
                .bold()
                .font(.system(size: 20.0))
            Spacer()
           
        }
        .padding(20.0)
    }
}

struct SimpleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleHeaderView(title: "Titulo")
    }
}
