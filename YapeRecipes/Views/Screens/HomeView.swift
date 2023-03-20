//
//  HomeView.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import SwiftUI
import Coordinator
import ReSwift
import ReSwiftThunk
import SwiftUI_FAB

struct HomeView: View {
    
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
                    ForEach(self.store.state.recipes.list){
                        RecipeCardView(recipe: $0)
                    }
                }
                .floatingActionButton(color: Color("Main"), image: Image(systemName: "plus").foregroundColor(.white)) {
                    coordinator.trigger(.addRecipe)
                }
                .navigationTitle("Recetas")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .onAppear{
            self.store.dispatch(fetchThunk())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
