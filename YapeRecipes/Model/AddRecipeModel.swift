//
//  AddRecipeModel.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 23-03-23.
//

import Foundation
import Combine
import FormValidator
import CoreLocation

class AddRecipeModel: ObservableObject {

    @Published var name: String = ""
    @Published var textDescription: String = ""
    @Published var cal: Int = 100
    @Published var durationAmount: Int = 8
    @Published var ingredients: [String] = []
    @Published var type  = 0

  
    lazy var form = {
        FormValidation(validationType: .immediate)
    }()
    
    
    lazy var nameValidation: ValidationContainer = {
        $name.nonEmptyValidator(form: form, errorMessage: "Debes escribir un nombre")
    }()
    
    lazy var textDescriptionValidation: ValidationContainer = {
        $textDescription.nonEmptyValidator(form: form, errorMessage: "Debes escribir una descripción")
    }()
    
    lazy var ingredientsValidation: ValidationContainer = {
        $ingredients.nonEmptyValidator(form: form, errorMessage: "Debes agregar por lo menos un ingrediente")
    }()
    
    
    func addIngredient(name: String){
        self.ingredients.append(name)
    }
    
    func getRecipe(location: CLLocationCoordinate2D) -> Recipe {
        let types: [FoodType] = [.mainDish, .soup, .dessert, .coctel]
        var recipe = Recipe()
        recipe.name = self.name
        recipe.textDescription = self.textDescription
        recipe.cal = self.cal
        recipe.duration = self.durationAmount
        recipe.type = types[self.type]
        recipe.location = Location(latitude: location.latitude, longitude: location.longitude)
        recipe.ingredients = ingredients
        
        return recipe
    }
}
