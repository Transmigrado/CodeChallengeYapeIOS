//
//  ImageThunk.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//


import Foundation
import ReSwift
import ReSwiftThunk
import Firebase
import FirebaseStorage


func uploadImageAndPublishRecipeThunk(image: UIImage,  recipe: Recipe) -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in
        
        let storage = Storage.storage()
       
        let storageRef = storage.reference().child("recipes/\(UUID().uuidString).jpg")

        let data = image.jpegData(compressionQuality: 1.0)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        if let data = data {
           storageRef.putData(data, metadata: metadata) { (metadata, error) in
               if let error = error {
                   print("Error while uploading file: ", error)
               }

               if metadata != nil {
                   storageRef.downloadURL {
                       if($1 == nil){
                           var newRecipe = recipe
                           newRecipe.cover = $0?.absoluteString
                           dispatch(addRecipeThunk(recipe: newRecipe))
                       }
                      
                   }
               }
           }
       }
        
    }
}
