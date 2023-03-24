//
//  Recipe.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import SwiftUI
import Firebase

struct Recipe: Identifiable, Equatable {
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String?
    var cover: String?
    var cal: Int?
    var duration : Int?
    var userId: String?
    var type: FoodType?
    var textDescription: String?
    
    var location: Location?
    
    
    var ingredients: [String] = []
    
  
}

extension Recipe {
    init(snapshot: QueryDocumentSnapshot) {
  
        let snapshotValue = snapshot.data()
        name = snapshotValue["name"] as? String
        cover = snapshotValue["cover"] as? String
        duration = snapshotValue["duration"] as? Int
        cal = snapshotValue["cal"] as? Int
        userId = snapshotValue["userId"] as? String
        textDescription = snapshotValue["description"] as? String
        ingredients = (snapshotValue["ingredients"] as? [String])!
        let firGeoPoint = snapshotValue["location"] as! GeoPoint
        location = Location(latitude: firGeoPoint.latitude, longitude: firGeoPoint.longitude)
        
        type = FoodType(rawValue:  snapshotValue["type"] as! String)!
        
    }
}
