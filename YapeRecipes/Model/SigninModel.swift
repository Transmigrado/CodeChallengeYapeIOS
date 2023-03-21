//
//  signinModel.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 21-03-23.
//

import Foundation
import Combine
import FormValidator


class SigninModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
  
    lazy var form = {
        FormValidation(validationType: .immediate)
    }()
    
    
    lazy var emailValidation: ValidationContainer = {
        $email.emailValidator(form: form, errorMessage: "Debes escribir un correo válido")
    }()
    
    lazy var passwordValidation: ValidationContainer = {
        $password.passwordValidator(form: form, errorMessage: "Debes escribir una contraseña válida")
    }()
}
