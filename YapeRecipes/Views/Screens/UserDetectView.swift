//
//  UserDetectView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI
import Firebase

struct UserDetectView: View {
    var body: some View {
        if(Auth.auth().currentUser == nil){
             SigninView()
        } else {
             MainView()
        }
    }
}

struct UserDetectView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetectView()
    }
}
