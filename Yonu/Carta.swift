//
//  Carta.swift
//  Yonu
//
//  Created by Jaime Castañeda on 14/02/22.
//

import SwiftUI

struct Carta: View {
    let card: String
    let gameStarted: Bool
    let showConfig: Bool
    let showInfo: Bool
    
    var body: some View {
        
        Rectangle()
            .cornerRadius(20)
            .padding(gameStarted ? 0 : 30)
            .padding(showConfig ? 30 : 0)
            .padding(showInfo ? 30 : 0)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.width * 0.92)
            .overlay(
                ZStack {
                    Image(card)
                        .resizable()
                        .cornerRadius(20)
                        .scaledToFit()
                        .padding(gameStarted ? 0 : 30)
                        .padding(showConfig ? 30 : 0)
                        .padding(showInfo ? 30 : 0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5))
                }
            )
    }
}

//struct Carta_Previews: PreviewProvider {
//    static var previews: some View {
//        Carta()
//    }
//}
