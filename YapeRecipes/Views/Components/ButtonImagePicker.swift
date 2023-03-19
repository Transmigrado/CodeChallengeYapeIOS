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
    public var action : (_ image:UIImage) -> ()
    
    var body: some View {
        Button {
            showSheet = true
        } label: {
            Text("Tomar image")
        }
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        .onChange(of: image) { _ in
            self.action(image)
        }

    }
}

