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


func uploadImageThunk(image: UIImage) -> Thunk<AppState>{
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

               if let metadata = metadata {
                   print("Metadata: ", metadata)
               }
           }
       }
        
    }
}
