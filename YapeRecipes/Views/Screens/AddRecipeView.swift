//
//  AddRecipeView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct AddRecipeView: View {
    
    @EnvironmentObject var store: AppStore
    @State private var name = ""
    @State private var textDescription = ""
    @State private var sleepAmount = 8
    @State private var cal = 100
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10.0){
                
                ZStack{
                    ButtonImagePicker(action: {image in
                        self.store.dispatch(uploadImageThunk(image: image))
                    })
                }
                .padding(10.0)
             
                TextField("Nombre", text: $name)
                    .textFieldStyle(RoundedTextField())
                
                TextField("Descripción", text: $textDescription)
                    .textFieldStyle(RoundedTextField())
               
                Divider()
                
                VStack(alignment: .leading){
                    
                    HStack(spacing:5.0){
                        Text("Calorias")
                            .bold()
                        Text("Por cada 100 grs")
                    }
                    
                    HStack{
                        Image("icCal")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                        TextField("Calorias", value: $cal, format: .number)
                            .textFieldStyle(RoundedTextField())
                    }
                    .padding(10.0)
                }
    
                Divider()
                VStack(alignment: .leading){
                    Text("Tiempo de preparación")
                        .bold()
                    HStack{
                        Image("icTime")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                        Stepper("\(sleepAmount) minutos", value: $sleepAmount, in: 5...60)
                    }
                    .padding(10.0)
                }

              
                Divider()
                VStack(alignment: .leading){
                    Text("Tipo")
                        .bold()
                   FoodTypeSelector()
                }
                .padding(10.0)
                
              
                
                Button {
                    let recipe = Recipe(name: name, textDescription: textDescription)
                    self.store.dispatch(addRecipeThunk(recipe: recipe))
                } label: {
                    Text("Agregar Receta")
                }

            }
            .padding(.horizontal, 10.0)
        }
       
   
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
