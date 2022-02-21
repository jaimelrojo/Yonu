//
//  Config.swift
//  Yonu
//
//  Created by Jaime Castañeda on 15/02/22.
//

import SwiftUI

struct Config: View {
    
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
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        showRules = true
                    } label: {
                        Blur(effect: UIBlurEffect(style: .dark))
                            .mask(Image(systemName: "questionmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                            )
                            .frame(width: UIScreen.main.bounds.width * 0.10,
                                   height: UIScreen.main.bounds.width * 0.10)
                    }
                    .disabled(alert)
                }
                
                Spacer()
                
                HStack {
                    Blur(effect: UIBlurEffect(style: .dark))
                        .mask(
                            Text("Cartas +18")
                                .font(.custom("Lovelo Black",
                                              size: gameStarted ? UIScreen.main.bounds.height * 0.042 :  UIScreen.main.bounds.height * 0.035))
                        )
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                    
                    Toggle("", isOn: $eighteenPlusToggle)
                        .transition(.scale(scale: 0.8) .combined(with: .opacity))
                }
                
                Spacer()
                
                HStack {
                    
                    Button {
                        showMailView.toggle()
                    } label: {
                        Blur(effect: UIBlurEffect(style: .dark))
                            .mask(Image(systemName: "envelope.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                            )
                            .frame(width: UIScreen.main.bounds.width * 0.10,
                                   height: UIScreen.main.bounds.width * 0.10)
                    }
                    .disabled(alert)
                    .disabled(!MailView.canSendMail)
                    .sheet(isPresented: $showMailView) {
                        MailView(data: $mailData) { result in
                            print(result)
                        }
                    }
                }
                
//                if gameStarted == true {
//
//                    Button {
//                        ReiniciarJuego()
//                    } label: {
//                        Text("Reiniciar juego")
//                            .font(.custom("Lovelo Black", size: UIScreen.main.bounds.height * 0.025))
//                            .foregroundColor(Color("YonuBlack"))
//                            .padding(9)
//                            .padding(.top, 3)
//                            .padding(.horizontal, 40)
//                            .background(Color("AnamorphicRed"))
//                            .cornerRadius(12)
//                            .shadow(color: .red, radius: 20)
//                    }
//                }
            }
            .padding(gameStarted ? 40 : 30)
                     : nil
            )
            .foregroundColor(.black)
            .font(.title)
            .toggleStyle(SwitchToggleStyle(tint: Color("AnamorphicBlue")))
            .padding(gameStarted ? 0 : 30)
            .padding(showConfig ? 2 : 30)
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

struct Config_Previews: PreviewProvider {
    static var previews: some View {
        Config(showConfig: .constant(true), gameStarted: .constant(true), eighteenPlusToggle: .constant(true), shuffleOrNext: .constant(true), alert: .constant(true), counter1: .constant(0), counter2: .constant(0), flipped: .constant(true), flip: .constant(0), showRules: .constant(false))
    }
}
