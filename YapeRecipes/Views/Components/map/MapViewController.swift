//
//  MapViewController.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import MapboxMaps

class MapViewController: UIViewController {
   internal var mapView: MapView!
   override public func viewDidLoad() {
       super.viewDidLoad()
       let myResourceOptions = ResourceOptions(accessToken: ProcessInfo.processInfo.environment["MAPBOX_API_KEY"] ?? "")
       let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: -33.4575046, longitude: -70.6184518), zoom: 4.5)

       let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions,styleURI: StyleURI(rawValue: "mapbox://styles/mapbox/streets-v12"))
       
       mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
       mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       self.view.addSubview(mapView)
   }
}
