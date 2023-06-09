//
//  SigninWithEmailView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 20-03-23.
//

import SwiftUI

struct SigninWithEmailView: View {
    
    
    @ObservedObject var model = SigninModel()
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        VStack{
            
            SimpleHeaderView(title: "Ingresar con correo")

            VStack{
                VStack(spacing: 10.0){
                    CustomTextField(text: $model.email, placeholder: "Correo")
                        .validation(model.emailValidation) { message in
                                    Text(message)
                                            .foregroundColor(Color.red)
                                            .font(.caption)
                                    }
                    CustomTextField(text: $model.password, placeholder: "Contraseña")
                        .validation(model.passwordValidation) { message in
                                    Text(message)
                                            .foregroundColor(Color.red)
                                            .font(.caption)
                                    }
                }
                .padding(10.0)
                
                Spacer()

                Button {
                    self.store.dispatch(signinThunk(email: model.email, password: model.password))
                } label: {
                    HStack{
                        Text("Crear")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .buttonStyle(Rounded(color: Color("Main")))
            }
            .padding(10.0)
        }
        .frame(alignment: .top)
    }
}

struct SigninWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithEmailView()
    }
}
