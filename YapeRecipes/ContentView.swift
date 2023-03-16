//
//  ContentView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedTextField())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedTextField())
            ButtonView()
        }
        .padding()
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
