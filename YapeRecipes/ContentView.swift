//
//  ContentView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 16-03-23.
//

import SwiftUI
import Coordinator

struct ContentView: View {
    @Coordinator(for: AppDestination.self) var coordinator

    var body: some View {
        VStack {
           Button("Main") {
               coordinator.trigger(.main)
           }
           
           Button("Signin") {
               coordinator.trigger(.signin)
           }
       }
    }

    
}
