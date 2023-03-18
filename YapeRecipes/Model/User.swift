//
//  User.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Foundation
import SwiftUI


struct User: Identifiable {
    var id = UUID()
    var name: String
    var lastName: String
    var email: String
}

