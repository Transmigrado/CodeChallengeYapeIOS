//
//  NewIngredientView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 23-03-23.
//

import SwiftUI

import Foundation
import SwiftUI


struct NewIngredientView: View {
    
    @Binding var isShow: Bool
    
    public var onEdit: (_ name: String) -> ()
    
    @State private var ingredientName: String = ""
    @State private var isEditing: Bool = false
    
    
    var body: some View {
        
        
        VStack {
            Spacer()
            
            VStack(alignment: .leading){
                HStack {
                    Text("Agregar ingrediente")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        self.isShow = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                    }
                }
                
                
                TextField("Nombre", text: self.$ingredientName, onEditingChanged: {
                    self.isEditing = $0
                })
                   .textFieldStyle(RoundedTextField())
                

                
                Button(action: {
                    guard self.ingredientName.trimmingCharacters(in: .whitespaces) != "" else {
                        return
                    }
                    
                    self.isShow = false
                    
                    self.onEdit(self.ingredientName)
                    
                }){
                    Text("Agregar")
                        .fontWeight(.bold)
                        .padding()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .offset(y: self.isEditing ? -320 : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
  
}

