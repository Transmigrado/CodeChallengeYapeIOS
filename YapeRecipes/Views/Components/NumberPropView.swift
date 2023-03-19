//
//  NumberPropView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI

struct NumberPropView: View {
    
    var icon: String
    var propName: String
    var value: String
    
    
    var body: some View {
        VStack{
            Image(icon)
                .resizable()
                .frame(width: 24, height: 24)
            VStack{
                Text(propName)
                    .font(.system(size: 12))
                    .bold()
                Text(value)
                    .font(.system(size: 12))
            }
        }
        .frame(width: 52.0)
    }
}

