//
//  PantallaCarga.swift
//  Yonu
//
//  Created by Jaime Castañeda on 18/02/22.
//

import SwiftUI

struct PantallaCarga: View {
    
    @State private var showLoadingScreen: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    
    @Binding var showLaunchScreen: Bool
    
    var body: some View {
        ZStack {
            
            Color("YonuBlack")
                .edgesIgnoringSafeArea(.all)
            
            //MARK: Logo
            
            if showLoadingScreen == true {
                
                HStack(alignment: .center, spacing: -18) {
                    
                    VStack(alignment: .center, spacing: -42) {
                        
                        Text("Y")
//                            .offset(y: counter == 25 ? -20 : 0)
                            .opacity(counter == 6 ? 0.1 : 1)
                            .opacity(counter == 8 ? 0.2 : 1)
                            .opacity(counter == 10 ? 0.1 : 1)
                            .opacity(counter == 11 ? 0.4 : 1)
                            .opacity(counter == 12 ? 0.2 : 1)
                            .opacity(counter == 15 ? 0.3 : 1)
                            .opacity(counter == 16 ? 0.1 : 1)
                            .opacity(counter == 20 ? 0.3 : 1)
                            .opacity(counter == 23 ? 0.2 : 1)
                            .opacity(counter == 24 ? 0.3 : 1)
                            .opacity(counter == 25 ? 0.2 : 1)
                        Text("N")
//                            .offset(y: counter == 15 ? -40 : 0)
                    }
                    .foregroundColor(Color("AnamorphicRed"))
                    .shadow(color: Color("AnamorphicRed"), radius: 5)
                    .offset(x: showLoadingScreen ? 0 : -500)
                    
                    VStack(alignment: .center, spacing: -42) {
                        
                        Text("O")
//                            .offset(y: counter == 10 ? -40 : 0)
                        Text("U")
//                            .offset(y: counter == 20 ? -40 : 0)
                    }
                    .foregroundColor(Color("AnamorphicBlue"))
                    .shadow(color: Color("AnamorphicBlue"), radius: 5)
                    .offset(x: showLoadingScreen ? 0 : 500)
                }
                .font(.custom("Lovelo Black", size: UIScreen.main.bounds.height * 0.13))
                .frame(height: UIScreen.main.bounds.height / 6.7, alignment: .center)
                .shadow(color: .black, radius: 10)
                .transition(AnyTransition.opacity.animation(.spring(response: 1, dampingFraction: 0.8)))
            }
        }
        .onAppear {
            showLoadingScreen.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring(response: 1, dampingFraction: 0.7)) {
                if counter <= 40 {
                    counter += 1
                } else {
                    withAnimation(.spring()) {
                        showLoadingScreen = false
                        showLaunchScreen = false
                    }
                }
            }
        }
    }
}

struct PantallaCarga_Previews: PreviewProvider {
    static var previews: some View {
        PantallaCarga(showLaunchScreen: .constant(true))
    }
}
