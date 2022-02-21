//
//  Info.swift
//  Yonu
//
//  Created by Jaime Castañeda on 15/02/22.
//

import SwiftUI

struct Info: View {
    
    let showInfo: Bool
    let flipped: Bool
    let startingCard: [Int]
    let counter1: Int
    let counter2: Int
    let gameStarted: Bool
    let infoText: [String]
    
    var body: some View {
        
        Blur(effect: UIBlurEffect(style: .light))
            .opacity(showInfo ? 0.9 : 0)
            .mask(Rectangle())
            .cornerRadius(20)
            .shadow(color: .black, radius: 10, x: 0, y: 10)
            .overlay(showInfo ? Text(flipped ? infoText[startingCard[counter2]] : infoText[startingCard[counter1]])
                        .font(.custom("Lovelo Black", size: UIScreen.main.bounds.height * 0.03))
                        .frame(width: UIScreen.main.bounds.width * 0.7,
                               height: UIScreen.main.bounds.height / 5)
                        .multilineTextAlignment(.center)
                        .transition(.scale(scale: 0.8).combined(with: .opacity))
                        .animation(.spring(response: 0.3, dampingFraction: 0.5))
                     : nil
            )
            .foregroundColor(Color("YonuBlack"))
            .padding(gameStarted ? 0 : 30)
            .padding(showInfo ? 2 : 30)
            .frame(width: UIScreen.main.bounds.width * 0.92,
                   height: UIScreen.main.bounds.width * 0.92)
            .animation(.spring(response: 0.5, dampingFraction: 0.5))
    }
}

//struct Info_Previews: PreviewProvider {
//    static var previews: some View {
//        Info()
//    }
//}
