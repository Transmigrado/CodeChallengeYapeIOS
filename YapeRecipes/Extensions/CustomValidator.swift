//
//  CustomValidator.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 24-03-23.
//

import Foundation
import FormValidator


public class NonEmptyArrayValidator: FormValidator {
   
    
    public var isEmpty = false
    
    public var publisher: ValidationPublisher!
    public var subject: ValidationSubject = .init()
    public var onChanged: [OnValidationChange] = []

    public var errorMessage: StringProducerClosure = {
        ""
    }
    
    init(){
        
    }
    
    public var value: [String] = []
    
    public func validate() -> Validation {
        if value.isEmpty {
            return .failure(message: errorMessage())
        }
        return .success
    }
   
}

extension Published.Publisher where Value == [String] {
    func nonEmptyValidator(
            form: FormValidation,
            errorMessage: @autoclosure @escaping StringProducerClosure = ""
    ) -> ValidationContainer {
        let validator = NonEmptyArrayValidator()
        let message = errorMessage()
        return ValidationPublishers.create(
                form: form,
                validator: validator,
                for: self.eraseToAnyPublisher(),
                errorMessage: !message.isEmpty ? message : form.messages.required, onValidate: {_ in })
    }
}
