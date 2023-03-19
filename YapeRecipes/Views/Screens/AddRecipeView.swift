//
//  AddRecipeView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct AddRecipeView: View {
    
    @EnvironmentObject var store: AppStore
    @State var name = ""
    @State var textDescription = ""
    
    var body: some View {
        VStack{
            TextField("Nombre", text: $name)
                .textFieldStyle(RoundedTextField())
            TextField("Descripción", text: $textDescription)
                .textFieldStyle(RoundedTextField())
            
            ButtonImagePicker(action: {image in
                self.store.dispatch(uploadImageThunk(image: image))
            })
            
            Button {
                let recipe = Recipe(name: name, textDescription: textDescription)
                self.store.dispatch(addRecipeThunk(recipe: recipe))
            } label: {
                Text("Agregar Receta")
            }

        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
