//
//  RecipeThunk.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import Foundation
import ReSwift
import ReSwiftThunk
import Firebase
import FirebaseStorage


func addRecipeThunk(recipe: Recipe) -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in
        
        let db = Firestore.firestore()
        
        db.collection("Recipes").addDocument(data: [
            "name": recipe.name ?? "",
            "description": recipe.textDescription ?? "",
            "cal": recipe.cal ?? 100,
            "duration": recipe.duration ?? 8,
            "type": recipe.type?.rawValue ?? "main_dish",
            "cover": recipe.cover ?? "",
            "ingredients": recipe.ingredients,
            "location": GeoPoint(latitude: recipe.location!.latitude, longitude: recipe.location!.longitude),
            "createdAt": Date(),
            "updatedAt": Date()
        ]) { err in
            
            dispatch(fetchThunk())
        }
        
    }
}
