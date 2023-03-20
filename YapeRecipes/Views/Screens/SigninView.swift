//
//  SigninView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import Firebase
import Coordinator


struct SigninView: View {
    
    @Coordinator(for: AppDestination.self) var coordinator
    @EnvironmentObject var store: AppStore

    var body: some View {
        VStack {
            
            ImageCardView()
            
            VStack(spacing: 5.0){
                Text("Descubre el mejor sabor")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 28))
                    .bold()
                Text("Explora y comparte recetas con toda la comunidad")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20.0)
            }
            .padding(.vertical, 20.0)
                
            Spacer()
            
            VStack(spacing: 20.0){
                
                Button {
                    self.coordinator.trigger(.signinWithEmail)
                } label: {
                    HStack{
                        Image("icEmail")
                        Text("Contectar con correo")
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                .buttonStyle(Rounded(color: .white))
                
                Button {
                    self.store.dispatch(googleSigninThunk {
                        self.coordinator.trigger(.main)
                    })
                } label: {
                    HStack{
                        Image("icGoogle")
                        Text("Contectar con google")
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                .buttonStyle(Rounded(color: .white))
            }
           

            Spacer()
            
            
            Button {
                self.coordinator.trigger(.signup)
            } label: {
                Text("¿Aún no tienes cuenta?, crea una gratis")
                    .foregroundColor(Color("Main"))
            }
            
              
        }
        .frame( alignment: .top)
        .padding(20.0)
    }

}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
