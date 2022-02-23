//
//  Config2.swift
//  Yonu
//
//  Created by Jaime Castañeda on 22/02/22.
//

import SwiftUI

struct Config2: View {
    
    @Environment(\.openURL) var openURL
    
    @Binding var showConfig: Bool
    @Binding var gameStarted: Bool
    @Binding var eighteenPlusToggle: Bool
    @Binding var shuffleOrNext: Bool
    @Binding var alert: Bool
    @Binding var counter1: Int
    @Binding var counter2: Int
    @Binding var flipped: Bool
    @Binding var flip: Double
    @Binding var showRules: Bool
    
    @State private var mailData = ComposeMailData(subject: "¡Sugerencia para Yonu!",
                                                  recipients: ["yonuapp@icloud.com"],
                                                  message: "")
    @State private var showMailView = false
    
    var body: some View {
        
        Blur(effect: UIBlurEffect(style: .light))
            .opacity(showConfig ? 0.9 : 0)
            .mask(Rectangle())
            .cornerRadius(20)
            .shadow(color: .black, radius: 10, x: 0, y: 10)
            .overlay(showConfig ?
                     VStack {
                
                Spacer()
                
                Blur(effect: UIBlurEffect(style: .dark))
                    .overlay(
                        HStack {
                            Blur(effect: UIBlurEffect(style: .extraLight))
                                .mask(
                                    Text("Cartas +18")
                                        .font(.custom("Lovelo Black",
                                                      size: gameStarted ? UIScreen.main.bounds.height * 0.042 :  UIScreen.main.bounds.height * 0.035))
                                        .offset(y: 4)
                                )
                            
                            Toggle("", isOn: $eighteenPlusToggle)
                                .transition(.scale(scale: 0.8) .combined(with: .opacity))
                        }
                        .padding(.horizontal, gameStarted ? 30 : 20)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5))
                        
                    )
                    .padding(.horizontal, gameStarted ? 0 : 30)
                    .frame(width: UIScreen.main.bounds.width * 0.92,
                           height: UIScreen.main.bounds.width * 0.28)
                    .transition(.scale(scale: 0.8) .combined(with: .opacity))
                    .animation(.spring(response: 0.5, dampingFraction: 0.5))
                    
                
                Spacer()
                
                VStack(spacing: 3) {
                    
                    Button {
                        showRules = true
                    } label: {
                        BotonRectangular(gameStarted: $gameStarted, text: "Reglas", height: 0.15)
                            .animation(.spring(response: 0.5, dampingFraction: 0.5))
                    }
                    .transition(.scale(scale: 0.8) .combined(with: .opacity))
                    .disabled(alert)
                    
                    Button {
                        showMailView.toggle()
                    } label: {
                        BotonRectangular(gameStarted: $gameStarted, text: "Contacto", height: 0.15)
                            .animation(.spring(response: 0.5, dampingFraction: 0.5))
                    }
                    .transition(.scale(scale: 0.8) .combined(with: .opacity))
                    .disabled(alert)
                    .disabled(!MailView.canSendMail)
                    .sheet(isPresented: $showMailView) {
                        MailView(data: $mailData) { result in
                            print(result)
                        }
                    }
                    
                    Button {
                        openURL(URL(string: "https://www.websitepolicies.com/policies/view/5zzwb506")!)
                    } label: {
                        BotonRectangular(gameStarted: $gameStarted, text: "Terms y conds", height: 0.15)
                            .animation(.spring(response: 0.5, dampingFraction: 0.5))
                    }
                    .transition(.scale(scale: 0.8) .combined(with: .opacity))
                    .disabled(alert)
                }
            }
                        .padding(.vertical, gameStarted ? 40 : 30)
                     : nil
            )
            .foregroundColor(.black)
            .font(.title)
            .toggleStyle(SwitchToggleStyle(tint: Color("AnamorphicRed")))
            .padding(gameStarted ? 0 : 30)
            .padding(showConfig ? 0 : 30)
            .frame(width: UIScreen.main.bounds.width * 0.92,
                   height: UIScreen.main.bounds.width * 0.92)
            .animation(.spring(response: 0.5, dampingFraction: 0.5))
    }
    
    func ReiniciarJuego() {
        withAnimation(.spring()) {
            gameStarted = false
            shuffleOrNext = false
            showConfig = false
            alert = false
            counter1 = 0
            counter2 = 0
            flipped = false
            flip = 0
        }
    }
}

struct Config2_Previews: PreviewProvider {
    static var previews: some View {
        Config2(showConfig: .constant(true), gameStarted: .constant(true), eighteenPlusToggle: .constant(true), shuffleOrNext: .constant(true), alert: .constant(true), counter1: .constant(0), counter2: .constant(0), flipped: .constant(true), flip: .constant(0), showRules: .constant(false))
    }
}

