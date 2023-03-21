//
//  RecipesReducerTest.swift
//  YapeRecipesTests
//
//  Created by Jorge Acosta Alvarado on 21-03-23.
//

import XCTest
@testable import YapeRecipes

final class RecipesReducerTest: XCTestCase {

    let recipe = Recipe( name: "MockRecipe", cal: 300, duration: 40, userId: "123", type: FoodType.soup, textDescription: "MockDescription")
    

    func testReducerFecth() throws {
    
        let list = [recipe]
        let action = FetchList(list: list)
        
        let newState: AppState = recipesReducer(action: action, state: nil)
        
        XCTAssertEqual(newState.recipes.list, [recipe])
    }
    
    func testReducerSearch() throws {
        
        let list = [recipe]
        let action = SearchList(list: list)
        
        let newState: AppState = recipesReducer(action: action, state: nil)
        
        XCTAssertEqual(newState.recipes.searchedList, [recipe])
    }
    
    func testReducerSelect() throws {

        let action = SelectItem(item: recipe)
        
        let newState: AppState = recipesReducer(action: action, state: nil)
        
        XCTAssertEqual(newState.recipes.selected, recipe)
    }


}
