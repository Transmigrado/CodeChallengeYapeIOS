//
//  User.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import SwiftUI


struct User: Identifiable, Equatable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String
    var lastName: String
    var email: String
}

