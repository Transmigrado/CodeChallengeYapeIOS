//
//  SigninView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import Firebase


struct SigninView: View {
    
    @EnvironmentObject var store: AppStore
    
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            
            ImageCardView()
            
            Text("Descubre el mejor sabor")
                .font(.system(size: 28))
                .bold()
            Text("Explora y comparte recetas con toda la comunidad")
                
            TextField(LocalizedStringKey("email"), text: $email)
                .textFieldStyle(RoundedTextField())
            SecureField(LocalizedStringKey("password"), text: $password)
                .textFieldStyle(RoundedTextField())
            Button(action: {
                   print("Edit tapped!")
               }) {
                   HStack {
                      
                       Text("Edit")
                           .fontWeight(.semibold)
                           .font(.title)
                   }
               }
            
            Button {
                self.store.dispatch(googleSigninThunk())
            } label: {
                Text("Contectar con google")
            }

              
        }
        .padding(10.0)
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
