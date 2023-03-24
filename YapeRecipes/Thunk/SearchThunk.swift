//
//  SearchThunk.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 20-03-23.
//


import Foundation
import ReSwift
import ReSwiftThunk
import Firebase

func searchListThunk(searchText: String) -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in
       
        let state = getState()
        

        let filteredList = state?.recipes.list.filter{
            ("\(String(describing: $0.name)) \($0.ingredients.joined(separator: " "))").lowercased().localizedCaseInsensitiveContains(searchText.lowercased())
        }
        
        dispatch(SearchList(list: filteredList ?? []))
  
        
    }
}
