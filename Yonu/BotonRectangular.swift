//
//  BotonRectangular.swift
//  Yonu
//
//  Created by Jaime Castañeda on 23/02/22.
//

import SwiftUI

struct BotonRectangular: View {
    
    @Binding var gameStarted: Bool
    let text: String
    let height: Double
    
    var body: some View {
        Blur(effect: UIBlurEffect(style: .dark))
            .overlay(
                HStack {
                    Blur(effect: UIBlurEffect(style: .extraLight))
                        .mask(
                            Text(text)
                                .font(.custom("Lovelo Black",
                                              size: gameStarted ? UIScreen.main.bounds.height * 0.042 :  UIScreen.main.bounds.height * 0.035))
                                .offset(y: 4)
                        )
                }
            )
            .padding(.horizontal, gameStarted ? 0 : 30)
            .frame(width: UIScreen.main.bounds.width * 0.92,
                   height: UIScreen.main.bounds.width * height)
    }
}

struct BotonRectangular_Previews: PreviewProvider {
    static var previews: some View {
        BotonRectangular(gameStarted: .constant(true), text: "Hola", height: 0.15)
    }
}
