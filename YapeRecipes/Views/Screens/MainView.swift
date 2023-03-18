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
            Text("First View")
                .tabItem({ Image("icHome") })
                .tag(0)
            Text("Second View")
                .tabItem({ Image("icMap") })
                .tag(1)
            Text("Third View")
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
