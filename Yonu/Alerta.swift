//
//  Alerta.swift
//  Yonu
//
//  Created by Jaime Castañeda on 15/02/22.
//

import SwiftUI

struct Alerta: View {
    
    @Binding var alert: Bool
    
    var body: some View {
        
        Blur(effect: UIBlurEffect(style: .light))
            .background(Color("AnamorphicRed"))
            .mask(Image(systemName: "rectangle.roundedtop.fill")
                    .resizable()
                    .padding(0)
            )
            .opacity(alert ? 0.9 : 0)
            .shadow(color: .black, radius: 10, x: 0, y: 10)
            .overlay(
                VStack(spacing: 5) {
                    
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.07,
                               height: UIScreen.main.bounds.width * 0.07)
                        .transition(.scale.combined(with: .move(edge: .bottom)))
                    
                    Text("Agregar o quitar cartas reiniciará el juego")
                        .font(.system(size: UIScreen.main.bounds.height / 40,
                                      weight: .light,
                                      design: .serif))
                        .italic()
                        .frame(width: 210, height: 51)
                        .multilineTextAlignment(.center)
                        .transition(.scale.combined(with: .move(edge: .bottom)))
                    
                    Text("Presiona \(Image(systemName: "shuffle")) para reiniciar Presiona \(Image(systemName: "chevron.right")) para continuar")
                        .font(.system(size: UIScreen.main.bounds.height / 48,
                                      weight: .medium,
                                      design: .default))
                        .italic()
                        .frame(width: 245, height: 43)
                        .multilineTextAlignment(.center)
                        .transition(.scale.combined(with: .move(edge: .bottom)))
                }
                    .padding(.bottom, 55)
            )
            .frame(width: 290, height: 230)
            .opacity(alert ? 1 : 0)
            .offset(y: alert ? -(UIScreen.main.bounds.height / 3.6) : .zero)
            .transition(.scale(scale: 0.8))
            .animation(.spring(response: 0.5, dampingFraction: 0.7))
    }
}

//struct Alerta_Previews: PreviewProvider {
//    static var previews: some View {
//        Alerta()
//    }
//}
