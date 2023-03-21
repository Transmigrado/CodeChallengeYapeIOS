//
//  BackButton.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 21-03-23.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            dismiss()
        } label: {
            Image("icBack")
                .resizable()
                .frame(width: 24.0, height: 24.0)
              
        }
        .buttonStyle(CircleButton())
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
