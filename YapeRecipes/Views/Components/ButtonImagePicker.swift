//
//  ButtonImagePicker.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 19-03-23.
//

import SwiftUI

struct ButtonImagePicker: View {
    
    
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var isSelected = false
    public var action : (_ image:UIImage) -> ()
    
    var body: some View {
        Button {
            showSheet = true
        } label: {
            
            VStack{
                if(isSelected){
                    Image(uiImage: image)
                        .resizable()
                        .fill()
                } else {
                    VStack{
                        Image("icCamera")
                            .resizable()
                            .frame(width: 64.0, height: 53.0)
                        Text("Tomar imagen")
                    }
                    .padding(20.0)
                }
               
            }
            .frame(maxWidth: .infinity)
            .frame(height: 160.0)
           
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(color: Color("LightShadow"), x: 0, y: 4, blur: 20.0)
        }
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        .onChange(of: image) { _ in
            self.action(image)
            self.isSelected = true
        }

    }
}

