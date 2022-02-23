//
//  Instrucciones.swift
//  Yonu
//
//  Created by Jaime Castañeda on 16/02/22.
//

import SwiftUI

struct Instrucciones: View {
    
    let showRules: Bool
    
    var body: some View {
        
        Blur(effect: UIBlurEffect(style: .light))
            .background(Color("AnamorphicRed"))
            .mask(Rectangle())
            .cornerRadius(20)
            .shadow(color: .black, radius: 10, x: 0, y: 10)
            .overlay(
                Blur(effect: UIBlurEffect(style: .dark))
                    .mask(showRules ?
                        VStack(spacing: 55) {
                            
                            Text("Instrucciones")
                                .font(.custom("Lovelo Black",
                                              size: UIScreen.main.bounds.height * 0.045))
                                .underline()
                            
                            VStack(spacing: 25) {
                                Text("Lees la carta")
                                Text("Si lo has hecho o te ha pasado...")
                                Text("BEBES")
                                    .font(.custom("Lovelo Black",
                                                  size: UIScreen.main.bounds.height * 0.085))
                                Text("¡Así de facil!")
                            }
                            
                            Text("Bonus: Una buena historia siempre es bien recibida ;)")
                                .font(.custom("Lovelo Black",
                                              size: UIScreen.main.bounds.height * 0.022))
                        }
                            .padding(30)
                            .font(.custom("Lovelo Black",
                                          size: UIScreen.main.bounds.height * 0.035))
                            .multilineTextAlignment(.center)
                            .transition(.scale(scale: 0.8) .combined(with: .opacity))
                            .animation(nil)
                          
                          : nil
                    )
            )
            .padding(showRules ? 2 : 30)
            .frame(width: UIScreen.main.bounds.width * 0.92,
                   height: UIScreen.main.bounds.height * 0.65)
            .opacity(showRules ? 0.8 : 0)
            .animation(.spring(response: 0.5, dampingFraction: 0.5))
    }
}

struct Instrucciones_Previews: PreviewProvider {
    static var previews: some View {
        Instrucciones(showRules: true)
    }
}
