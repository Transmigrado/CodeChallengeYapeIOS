//
//  MapRecipesView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import MapboxMaps

struct MapRecipesView: View {
    
    @EnvironmentObject var store: AppStore
    @State private var camera = Camera(center: CLLocationCoordinate2D(latitude: -33.4575046, longitude: -70.6184518), zoom: 14)
    @State private var styleURI = StyleURI.streets

    
    var body: some View {
        ZStack{
            MapBoxMapView(camera: $camera)
                           .styleURI(styleURI)
                           .annotations(self.store.state.recipes.list)
        }
    }
}

struct MapRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        MapRecipesView()
    }
}
