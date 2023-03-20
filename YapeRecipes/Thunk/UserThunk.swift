//
//  UserThunk.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import Foundation
import ReSwift
import ReSwiftThunk
import Firebase
import FirebaseStorage
import GoogleSignIn
import Coordinator


func logoutThunk() -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in
        do{
            try Auth.auth().signOut()
        }catch {
            
        }
    }
}


func signinThunk(email:String, password: String) -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
               
            }
        }
    }
}


func googleSigninThunk(callback: @escaping () -> ()) -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        

        FirebAuth.share.signinWithGoogle(presenting: rootViewController) { error in
            
            if(error == nil){
                dispatch(createThunk())
                callback()
            }
        }
    }
}

func createThunk() -> Thunk<AppState> {
    
    return Thunk<AppState> { dispatch, getState in
        
        let currentUser = Auth.auth().currentUser
       
        let nameComponents = currentUser?.displayName?.components(separatedBy: " ")
        let name = nameComponents![0]
        let lastName = nameComponents![1]
        let email = currentUser?.email
        
        let db = Firestore.firestore()
        let ref: DocumentReference = db.collection("Users").document(currentUser?.uid ?? "")
     
        ref.setData([
            "name": name,
            "lastName": lastName,
            "email": email ?? "",
            "createdAt": Date(),
            "updatedAt": Date()
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                
            }
        }
    }
    
}
