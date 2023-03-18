//
//  Recipes.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import Firebase

class RecipesManager: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    
    func fetch() {
        let db = Firestore.firestore()
        db.collection("Recipes")
            .getDocuments { snapshoot, error in
                if(error == nil){
                    self.recipes = (snapshoot?.documents.map{Recipe(snapshot: $0)})!
                }
            }
    }
    
}
