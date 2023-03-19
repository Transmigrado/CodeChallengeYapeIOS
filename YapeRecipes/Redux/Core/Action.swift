//
//  Action.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//


import ReSwift
import SwiftUI

struct FetchList<T>: Action {
    var list: [T]
}

struct SelectItem<T>: Action {
    var item: T
}
