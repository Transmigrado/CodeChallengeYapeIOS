//
//  SigninView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import Firebase

struct SigninView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedTextField())
            SecureField("Password", text: $password)
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
