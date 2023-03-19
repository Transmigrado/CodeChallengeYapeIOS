//
//  FirebAuth.swift
//  SignInUsingGoogle
//
//  Created by Swee Kwang Chua on 12/5/22.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase

struct FirebAuth {
    static let share = FirebAuth()
    
    private init() {}
    
    func signinWithGoogle(presenting: UIViewController,
                          completion: @escaping (Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        print(clientID)
        
        let config = GIDConfiguration(clientID: clientID)
    
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presenting){ result, error in
            
            let credential = GoogleAuthProvider.credential(withIDToken: result?.user.idToken?.tokenString ?? "", accessToken: result?.user.accessToken.tokenString ?? "")

              Auth.auth().signIn(with: credential) { result, error in
                  guard error == nil else {
                      completion(error)
                      return
                  }
                
              }
        }
    }
}
