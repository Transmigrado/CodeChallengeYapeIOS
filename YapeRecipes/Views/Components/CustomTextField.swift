//
//  CustomTextField.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 20-03-23.
//

import SwiftUI
import FormValidator

struct CustomTextField: View {
    
    @Binding var text: String
    var placeholder = ""
   
    
    var body: some View {
        TextField("", text: $text,  prompt: Text(placeholder).foregroundColor(.gray))
            .textFieldStyle(RoundedTextField())
           
    }
}

