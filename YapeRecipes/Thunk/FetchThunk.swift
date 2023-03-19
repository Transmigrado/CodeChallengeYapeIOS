//
//  FetchThunk.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//



import Foundation
import ReSwift
import ReSwiftThunk
import CoreData
import Firebase

func fetchThunk() -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in
        
        let db = Firestore.firestore()
        db.collection("Recipes")
            .getDocuments { snapshoot, error in
                if(error == nil){
                    let recipes = (snapshoot?.documents.map{Recipe(snapshot: $0)})!
                    dispatch(FetchList<Recipe>(list: recipes))
                }
            }
        
    }
}
