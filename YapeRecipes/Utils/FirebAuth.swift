//
//  FirebAuth.swift
//  SignInUsingGoogle
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase

struct FirebAuth {
    static let share = FirebAuth()
    
    private init() {}
    
    func signinWithGoogle(presenting: UIViewController, completion: @escaping (Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                
        let config = GIDConfiguration(clientID: clientID)
    
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presenting){ result, error in
            let idToken =  result?.user.idToken?.tokenString ?? ""
            let accessToken = result?.user.accessToken.tokenString ?? ""
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)

            Auth.auth().signIn(with: credential) { result, error in
                print("result->")
                
              guard error == nil else {
                  print("error->")
                  completion(error)
                  return
              }

            }
        }
    }
}
