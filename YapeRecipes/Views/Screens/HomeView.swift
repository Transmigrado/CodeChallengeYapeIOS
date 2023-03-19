//
//  HomeView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import ReSwift
import ReSwiftThunk

struct HomeView: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        NavigationView {
            List(self.store.state.recipes.list){_ in
                Text("hola")
            }
            .navigationTitle("Home")
        }
        .onAppear{
            self.store.dispatch(fetchThunk())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
