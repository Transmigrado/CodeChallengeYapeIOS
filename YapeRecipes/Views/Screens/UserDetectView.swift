//
//  UserDetectView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI
import Firebase
import Swinject
import Coordinator

struct UserDetectView: View {
    

    var container: Container
    
    var main: some View {
         let view: MainView = container.resolve(from: .main)
        return view
    }
    
    var signin: some View {
        let view: SigninView = container.resolve(from: .signin)
       return view
    }
    
    var body: some View {
        if(Auth.auth().currentUser == nil){
            signin
        } else {
            main
        }
    }
}


