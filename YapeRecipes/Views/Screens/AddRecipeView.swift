//
//  AddRecipeView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI
import _CoreLocationUI_SwiftUI

struct AddRecipeView: View {
    
    @EnvironmentObject var store: AppStore
    
    @StateObject var locationManager = LocationManager()
    @StateObject var model = AddRecipeModel()
    
    @State private var showNewIngredient = false
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10.0){
                    
                    ZStack{
                        ButtonImagePicker(action: {image in
                            self.store.dispatch(uploadImageThunk(image: image))
                        })
                    }
                    .padding(10.0)
                 
                    VStack{
                        TextField("Nombre", text: $model.name)
                            .textFieldStyle(RoundedTextField())
                        
                        TextField("Descripción", text: $model.textDescription)
                            .textFieldStyle(RoundedTextField())
                        
                        Divider()
                    }
                    
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
                            TextField("Calorias", value: $model.cal, format: .number)
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
                            Stepper("\(model.durationAmount) minutos", value: $model.durationAmount, in: 5...60)
                        }
                        .padding(10.0)
                    }

                  
                    Divider()
                    VStack(alignment: .leading){
                        Text("Tipo")
                            .bold()
                        Picker(selection: $model.type, label:
                                        Text("Picker Name")
                                        , content: {
                                            Text("Principal").tag(0)
                                            Text("Sopa").tag(1)
                                            Text("Postre").tag(2)
                                            Text("Coctel").tag(3)
                                    })
                    }
                    .padding(10.0)
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Tiempo de preparación")
                                .bold()
                            Spacer()
                            
                            Button {
                                self.showNewIngredient = true
                            } label: {
                                Image(systemName: "plus.app.fill")
                                    .font(.title3)
                            }
                           
                           
                        }
                        ForEach(model.ingredients, id: \.self){ ingredient in
                            HStack{
                                Text(ingredient)
                            }
                            .frame(alignment: .leading)
                        }
                    }
                    .padding(.vertical, 5.0)
                    
                    Divider()
                    
              
                    
                    Button {
                       
                    } label: {
                        HStack{
                            Text("Agregar receta")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .buttonStyle(Rounded(color: Color("Main")))
                   
                    
                }
                .padding(.horizontal, 10.0).onAppear{
                    locationManager.requestLocation()
                }
               
            }
            
            if self.showNewIngredient {
                Color.black
                  .opacity(0.5)
                  .ignoresSafeArea()
                            .onTapGesture {
                                self.showNewIngredient = false
                            }
                                
                NewIngredientView(isShow: self.$showNewIngredient, onEdit: { name in
                    self.model.addIngredient(name: name)
                })
                       .transition(.move(edge: .bottom))
                       .animation(.default, value: self.showNewIngredient)
            }
        }
        
   
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
