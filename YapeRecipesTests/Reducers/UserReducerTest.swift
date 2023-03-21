//
//  UserReducerTest.swift
//  YapeRecipesTests
//
//  Created by Jorge Acosta Alvarado on 21-03-23.
//

import XCTest
@testable import YapeRecipes

final class UserReducerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReducerSelect() throws {

        let user = User(name: "Jorge", lastName: "Acosta", email: "transmigrado@gmail.com")
        let action = SelectItem<User>(item: user)
        
        let newState: AppState = userReducer(action: action, state: nil)
        
        XCTAssertEqual(newState.userProfile.currentUser, user)
    }


}
