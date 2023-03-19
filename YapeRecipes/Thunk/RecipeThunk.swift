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
        
        var ref: DocumentReference? = nil
        ref = db.collection("Recipes").addDocument(data: [
            "name": recipe.name ?? "",
            "description": recipe.textDescription ?? "",
            "createdAt": Date(),
            "updatedAt": Date()
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
}
