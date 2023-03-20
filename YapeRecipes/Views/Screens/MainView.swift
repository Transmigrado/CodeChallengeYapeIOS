//
//  MainView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 17-03-23.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedItem = 0
    
    var body: some View {
        TabView(selection: $selectedItem) {
            HomeView()
                .tabItem({ ItemTab(icon: "icHome", title: "Home", selected: selectedItem == 0) })
                .tag(0)
            MapRecipesView()
                .tabItem({ ItemTab(icon: "icMap", title: "Mapa",selected: selectedItem == 1) })
                .tag(1)
            ProfileView()
                .tabItem({ ItemTab(icon: "icUser", title: "Perfil", selected: selectedItem == 2) })
                .tag(2)
        }
        .accentColor(Color.accentColor)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
