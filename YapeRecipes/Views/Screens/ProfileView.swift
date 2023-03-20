//
//  ProfileView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import Coordinator

struct ProfileView: View {
    
    @EnvironmentObject var store: AppStore
    @Coordinator(for: AppDestination.self) var coordinator
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            Text("are_you_sure_logout")
            Button("Cerrar sesión") {
               showingAlert = true
                
           }
           .alert("are_you_sure_logout", isPresented: $showingAlert) {
               Button("Cancel", role: .destructive) { }
               Button("Salir", role: .cancel) {
                   coordinator.trigger(.signin)
                   self.store.dispatch(logoutThunk())
               }
           }
        }
        
     
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
