//
//  MainView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 17-03-23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem({ Image("icHome") })
                .tag(0)
            MapRecipesView()
                .tabItem({ Image("icMap") })
                .tag(1)
            ProfileView()
                .tabItem({ Image("icUser") })
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
