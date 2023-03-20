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
                print("success")
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
                callback()
            }
        }
    }
}
