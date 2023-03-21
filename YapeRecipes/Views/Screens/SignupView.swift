//
//  SignupView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 20-03-23.
//

import SwiftUI
import Coordinator

struct SignupView: View {
    
    @ObservedObject var model = SignupModel()
   
    
    var body: some View {
        VStack{
            
            SimpleHeaderView(title: "Crear cuenta")

            VStack{
                VStack(spacing: 10.0){
                    
                 
                    CustomTextField(text: $model.name, placeholder: "Nombre")
                        .validation(model.nameValidation) { message in
                                    Text(message)
                                            .foregroundColor(Color.red)
                                            .font(.caption)
                                    }
                    
                    CustomTextField(text: $model.lastName, placeholder: "Apellido")
                        .validation(model.lastNameValidation) { message in
                                    Text(message)
                                            .foregroundColor(Color.red)
                                            .font(.caption)
                                    }
                    
                    CustomTextField(text: $model.email, placeholder: "Correo")
                        .validation(model.emailValidation) { message in
                                    Text(message)
                                            .foregroundColor(Color.red)
                                            .font(.caption)
                                    }
                }
                .padding(10.0)
                
                Spacer()

                Button {
                   
                } label: {
                    HStack{
                        Text("Crear")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .buttonStyle(Rounded(color: Color("Main")))
                .disabled(true)
            }
            .padding(10.0)
        }
        .frame(alignment: .top)
       

    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
