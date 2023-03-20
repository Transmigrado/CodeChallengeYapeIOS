//
//  SearchView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 20-03-23.
//

import SwiftUI
import Coordinator

struct SearchView: View {
    @Coordinator(for: AppDestination.self) var coordinator
    @EnvironmentObject var store: AppStore
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    HStack{
                        TextField("", text: $searchText, prompt: Text("Buscar receta").foregroundColor(.gray))
                            .textFieldStyle(SearchTextfield())
                    }
                    .padding(10.0)
                    .background(.white)
                    ForEach(self.store.state.recipes.searchedList){
                        RecipeCardView(recipe: $0)
                    }
                }
                .navigationTitle("Buscar")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .onChange(of: searchText) { _ in
            self.store.dispatch(searchListThunk(searchText: searchText))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
