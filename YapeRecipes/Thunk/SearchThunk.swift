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
            $0.name!.localizedCaseInsensitiveContains(searchText)
        }
        
        dispatch(SearchList(list: filteredList ?? []))
  
        
    }
}
