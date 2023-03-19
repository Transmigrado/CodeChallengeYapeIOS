//
//  MapBoxMapView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import UIKit
import MapboxMaps
import SwiftUI

struct MapBoxMapView: UIViewRepresentable {
 

       @Binding private var camera: Camera
      
       private var styleURI = StyleURI.streets

       func styleURI(_ styleURI: StyleURI) -> Self {
           var updated = self
           updated.styleURI = styleURI
           return updated
       }
       private var annotations = [PointAnnotation]()

       func annotations(_ recipes: [Recipe]) -> Self {
           var updated = self
           
           let annotations: [PointAnnotation] =   recipes
                                                   .enumerated()
                                                   .map { (offset: Array<Recipe>.Index, recipe: Recipe) in
                                                       var annotation = PointAnnotation(id: offset.description, coordinate: CLLocationCoordinate2D(latitude: recipe.location.latitude, longitude: recipe.location.longitude))
                                                    
                                                       annotation.image = .init(image: UIImage(named: "icRecipePin")!, name: "recipePin")
                                                       return annotation
                                                   }
           
           updated.annotations = annotations
           return updated
       }

   
       private let mapInitOptions: MapInitOptions

       init( camera: Binding<Camera>) {
           
           let myResourceOptions = ResourceOptions(accessToken: ProcessInfo.processInfo.environment["MAPBOX_API_KEY"] ?? "")
           let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: -33.4575046, longitude: -70.6184518), zoom: 10.0)

           let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions,styleURI: StyleURI(rawValue: "mapbox://styles/mapbox/streets-v12"))
           
           self.mapInitOptions = myMapInitOptions
           _camera = camera
       }

    
       func makeCoordinator() -> SwiftUIMapViewCoordinator {
           SwiftUIMapViewCoordinator(camera: $camera)
       }

      
       func makeUIView(context: UIViewRepresentableContext<MapBoxMapView>) -> MapView {
           let mapView = MapView(frame: .zero, mapInitOptions: mapInitOptions)

           context.coordinator.mapView = mapView

           updateUIView(mapView, context: context)

           return mapView
       }

       func updateUIView(_ mapView: MapView, context: Context) {

           context.coordinator.performWithoutObservation {
               mapView.mapboxMap.setCamera(to: CameraOptions(center: camera.center, zoom: camera.zoom))
           }

           if mapView.mapboxMap.style.uri != styleURI {
               mapView.mapboxMap.style.uri = styleURI
           }

           context.coordinator.pointAnnotationManager.annotations = annotations
       }
}


final class SwiftUIMapViewCoordinator {

    @Binding private var camera: Camera


    private(set) var pointAnnotationManager: PointAnnotationManager!

    var mapView: MapView! {
        didSet {
            cancelable?.cancel()
            cancelable = nil

       
            cancelable = mapView.mapboxMap.onEvery(event: .cameraChanged) { [unowned self] _ in
                guard !ignoreNotifications else {
                    return
                }
                camera.center = mapView.cameraState.center
                camera.zoom = mapView.cameraState.zoom
            }

            pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        }
    }

    private var cancelable: Cancelable?

    init(camera: Binding<Camera>) {
        _camera = camera
    }

    deinit {
        cancelable?.cancel()
    }

    private var ignoreNotifications = false

    func performWithoutObservation(_ block: () -> Void) {
        ignoreNotifications = true
        block()
        ignoreNotifications = false
    }
}
