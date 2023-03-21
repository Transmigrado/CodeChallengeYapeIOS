//
//  SignupModel.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 20-03-23.
//

import Foundation
import Combine
import FormValidator


class SignupModel: ObservableObject {
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
  
    lazy var form = {
        FormValidation(validationType: .immediate)
    }()
    
    lazy var nameValidation: ValidationContainer = {
        $name.nonEmptyValidator(form: form, errorMessage: "Debes escribir tu nombre")
    }()
    
    lazy var lastNameValidation: ValidationContainer = {
        $lastName.nonEmptyValidator(form: form, errorMessage: "Debes escribir tu apellido")
    }()
    
    lazy var emailValidation: ValidationContainer = {
        $email.emailValidator(form: form, errorMessage: "Debes escribir un correo válido")
    }()
}
