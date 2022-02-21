//
//  ContentView.swift
//  Yonu
//
//  Created by Jaime Castañeda on 14/02/22.
//

import SwiftUI

struct ContentView: View {
    
    let numDeLuces = 6
    @State var luzWidth: [Double] = [175, 177, 160, 170, 157, 164]
    @State var luzDegrees: [Double] = [163, 26, 124, 341, 195, 77]
    @State var luzColor: [Color] = [Color("AnamorphicRed"), Color("AnamorphicBlue"), Color("AnamorphicRed"), Color("AnamorphicBlue"), Color("AnamorphicRed"), Color("AnamorphicBlue")]
    @State var luzOffset: [Double] = [0, 0, 0, 0, 0, 0]
    @State var glassOpacity: Double = 0.2
    
    private var card: [String] = ["card0", "card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13", "card14", "card15", "card16", "card17", "card18", "card19", "card20", "card21", "card22", "card23", "card24", "card25", "card26", "card27", "card28", "card29", "card30", "card31", "card32", "card33", "card34", "card35", "card36", "card37", "card38", "card39", "card40", "card41"]
    @State private var baseCards = [1, 2, 3, 4, 5, 7, 10, 14, 20, 21, 22, 23, 24, 26, 28, 29, 30, 31, 32, 34, 35, 36, 37, 38, 39, 40, 41]
    @State private var eighteenPlusCards = [6, 8, 9, 11, 12, 13 ,15, 16, 17, 18, 19, 25, 27, 33]
    @State var eighteenPlusToggle: Bool = true
    @State private var startingCard = [0]
    @State private var cardback = [0]
    @State private var counter1: Int = 0
    @State private var counter2: Int = 0
    
    @State var gameStarted: Bool = false
    @State var showConfig: Bool = false
    @State var showInfo: Bool = false
    @State var shuffleOrNext: Bool = false
    @State var flipped: Bool = false
    @State var flip: Double = 0
    @State var alert: Bool = false
    @State var showRules: Bool = false
    @AppStorage("firstTimePlaying") var firstTimePlaying: Bool = true
    
    let flipAnimation: Animation
    let opacityAnimation: Animation
    
    init(flipTime: Double = 0.6) {
        self.flipAnimation = .spring(response: flipTime, dampingFraction: 0.8)
        self.opacityAnimation = .linear(duration: 0.001).delay(flipTime / 4.2)
    }
    
    var infoText = ["", //Card0
                            "¿Todo bien en casa?", //Card1
                            "Sus besos no son una droga, ridículo", //Card2
                            "", //Card3
                            "Dejame adivinar: ¿Kung Fu Panda 3?", //Card4
                            "", //Card5
                            "", //Card6
                            "", //Card7
                            "", //Card8
                            "", //Card9
                            "", //Card10
                            "", //Card11
                            "¿Dónde está tu honor, basura?", //Card12
                            "Uno siempre vuelve a donde fue feliz", //Card13
                            "Pero dime... ¿has estado cerca de vivir?", //Card14
                            "😏", //Card15
                            "", //Card16
                            "", //Card17
                            "", //Card18
                            "", //Card19
                            "", //Card20
                            "¿Tan rápido es hora del tequila?", //Card21
                            "", //Card22
                            "", //Card23
                            "", //Card24
                            "Chapulinear        Dísese del verbo: bajarle la novia a tu compa", //Card25
                            "", //Card26
                            "", //Card27
                            "", //Card28
                            "", //Card29
                            "", //Card30
                            "", //Card31
                            "Un niño flotó sobre mi y voló un auto con su rasho laser",//Card33
                            "",//Card33
                            "",//Card34
                            "",//Card33
                            "",//Card34
                            "",//Card33
                            "",//Card34
                            "",//Card35
                            "",//Card36
                            "",//Card37
                            "",//Card38
                            "",//Card39
                            "¿Qué estás esperando?",//Card40
                            ""//Card41
    ]
    
    var body: some View {
        ZStack {
            
            //MARK: Fondo
            Color("YonuBlack")
                .edgesIgnoringSafeArea(.all)
            
            //MARK: Luces de fondo
            VStack {
                ForEach(0..<numDeLuces) { index in
                    Luz(width: luzWidth[index],
                        degrees: luzDegrees[index],
                        color: luzColor[index],
                        offset: luzOffset[index])
                }
            }
            
            //MARK: Vidrio templado
            Blur(effect: UIBlurEffect(style: .light))
                .opacity(glassOpacity)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    if showRules == true {
                        showRules = false
                    } else {
                        showConfig = false
                    }
                    showInfo = false
                }
            
            //MARK: Contenido
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    //MARK: Boton config
                    
                    Button {
                        if showRules == false {
                            showConfig.toggle()
                        } else {
                            showRules = false
                        }
                        
                        if showInfo == true {
                            showInfo = false
                        }
                    } label: {
                        Boton(width: UIScreen.main.bounds.width * 0.18,
                              height: UIScreen.main.bounds.width * 0.18,
                              symbol: "gearshape.circle.fill")
                            .offset(y: 3)
                    }
                    .disabled(alert)
                }
                
                Spacer()
                
                //MARK: Logo
                
                HStack(alignment: .center, spacing: -18) {
                    
                    VStack(alignment: .center, spacing: -42) {
                        
                        Text("Y")
                            .animation(.spring(response: 0.7, dampingFraction: 0.8))
                        Text("N")
                            .animation(.spring(response: 0.7, dampingFraction: 0.8))
                    }
                    .foregroundColor(Color("AnamorphicRed"))
                    .shadow(color: Color("AnamorphicRed"), radius: 5)
                    
                    VStack(alignment: .center, spacing: -42) {
                        
                        Text("O")
                            .animation(.spring(response: 0.7, dampingFraction: 0.8).delay(0.1))
                        Text("U")
                            .animation(.spring(response: 0.7, dampingFraction: 0.8).delay(0.1))
                    }
                    .foregroundColor(Color("AnamorphicBlue"))
                    .shadow(color: Color("AnamorphicBlue"), radius: 5)
                    
                    if gameStarted == true {
                        VStack(alignment: .center, spacing: -12) {
                            Text("NCA")
                                .animation(.spring(response: 0.7, dampingFraction: 0.8).delay(0.1))
                            Text("NCA")
                                .animation(.spring(response: 0.7, dampingFraction: 0.8).delay(0.2))
                        }
                        .offset(x: UIScreen.main.bounds.width * 0.011,
                                y: UIScreen.main.bounds.height * 0.032)
                        .font(.custom("Lovelo Black", size: UIScreen.main.bounds.height * 0.060))
                        .foregroundColor(Color("AnamorphicBlue"))
                        .shadow(color: Color("AnamorphicBlue"), radius: 5)
                        .transition(.offset(x: 300))
                    }
                }
                .font(.custom("Lovelo Black", size: UIScreen.main.bounds.height * 0.13))
                .frame(height: UIScreen.main.bounds.height / 6.7, alignment: .center)
                .offset(y: alert ? 200 : 0)
                .offset(y: showRules ? -50 : 0)
                .shadow(color: .black, radius: 10)
                .onTapGesture {
                    if showRules == true {
                        showRules = false
                    } else {
                        showConfig = false
                    }
                    showInfo = false
                }
                .onAppear {
                    if firstTimePlaying == true {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            showRules.toggle()
                            firstTimePlaying = false
                        }
                    }
                }
                
                Spacer()
                
                ZStack {
                    
                    //MARK: Alerta
                    
                    Alerta(alert: $alert)
                    
                    //MARK: Carta
                    
                    ZStack {
                        Carta(card: card[startingCard[counter2]], gameStarted: gameStarted, showConfig: showConfig, showInfo: showInfo)
                            .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                            .opacity(flipped ? 1 : 0)
                            .animation(opacityAnimation)
                        
                        Carta(card: card[startingCard[counter1]], gameStarted: gameStarted, showConfig: showConfig, showInfo: showInfo)
                            .opacity(flipped ? 0 : 1)
                            .animation(opacityAnimation)
                    }
                    .shadow(color: .black, radius: 6, x: 0, y: 10)
                    .rotation3DEffect(Angle(degrees: flip), axis: (x: 0, y: 1, z: 0))
                    
                    //MARK: Menu config
                    
                    Config(showConfig: $showConfig, gameStarted: $gameStarted, eighteenPlusToggle: $eighteenPlusToggle, shuffleOrNext: $shuffleOrNext, alert: $alert, counter1: $counter1, counter2: $counter2, flipped: $flipped, flip: $flip, showRules: $showRules)
                    
                    //MARK: Menu info
                    
                    Info(showInfo: showInfo, flipped: flipped, startingCard: startingCard, counter1: counter1, counter2: counter2, gameStarted: gameStarted, infoText: infoText)
                        .onTapGesture {
                            showInfo = false
                        }
                }
                
                Spacer()
                
                HStack {
                    Boton(width: UIScreen.main.bounds.width * 0.12,
                          height: UIScreen.main.bounds.width * 0.12,
                          symbol: "circle.fill")
                        .opacity(0)
                    
                    Spacer()
                    
                    //MARK: Boton shuffle & next
                    
                    Button {
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                        
                        MoverLuces()
                        
                        if gameStarted == false {
                            gameStarted = true
                        }
                        if showConfig == true {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                                showConfig = false
                            }
                        }
                        if showInfo == true {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                                showInfo = false
                            }
                        }
                        withAnimation(flipAnimation) {
                            if shuffleOrNext == false {
                                BotonShuffle()
                            } else if shuffleOrNext == true {
                                BotonNext()
                            }
                        }
                    } label: {
                        Boton(width: UIScreen.main.bounds.width * 0.25,
                              height: UIScreen.main.bounds.width * 0.25,
                              symbol: shuffleOrNext ? "chevron.right.circle.fill" : "shuffle.circle.fill")
                    }
                    .onChange(of: eighteenPlusToggle) { _ in
                        if gameStarted == true {
                            shuffleOrNext.toggle()
                            alert = true
                        }
                    }
                    
                    Spacer()
                    
                    //MARK: Boton info
                    
                    if (flipped == true && infoText[startingCard[counter2]] != "") || (flipped == false && infoText[startingCard[counter1]] != "") {
                        Button {
                            BotonInfo()
                        } label: {
                            Boton(width: UIScreen.main.bounds.width * 0.11,
                                  height: UIScreen.main.bounds.width * 0.11,
                                  symbol: "info.circle.fill")
                        }
                        .disabled(alert)
                        .transition(.offset(x: 80))
                        .animation(.spring(response: 0.4, dampingFraction: 0.7))
                    } else {
                        Boton(width: UIScreen.main.bounds.width * 0.12,
                              height: UIScreen.main.bounds.width * 0.12,
                              symbol: "circle.fill")
                            .opacity(0)
                    }
                }
            }
            
            VStack {
                Spacer()
                
                //MARK: Instrucciones
                
                Instrucciones(showRules: showRules)
                    .onTapGesture {
                        showRules = false
                    }
            }
        }
    }
    
    //MARK: Funciones
    
    func MoverLuces() {
        for index in luzDegrees.indices {
            luzDegrees[index] = Double.random(in: 0...360)
        }
        for index in luzWidth.indices {
            luzWidth[index] = Double.random(in: 157...177)
        }
        for index in luzOffset.indices {
            luzOffset[index] = Double.random(in: -200...200)
        }
        glassOpacity = Double.random(in: 0.2...0.4)
    }
    
    func BotonShuffle() {
        if eighteenPlusToggle == true {
            self.startingCard = baseCards + eighteenPlusCards
            self.startingCard = cardback + startingCard.shuffled()
        } else {
            self.startingCard = cardback + baseCards.shuffled()
        }
        counter1 = 0
        counter2 = 1
        
        if alert == false {
            flipped = false
            flip = 0
        } else {
            flipped = true
            flip = 180
            gameStarted = false
        }
        
        shuffleOrNext = true
        flip += 180
        flipped.toggle()
        alert = false
    }
    
    func BotonNext() {
        if flipped == false && counter2 < startingCard.count-2 {
            counter2 += 2
        } else if flipped == true && counter1 < startingCard.count-2 {
            counter1 += 2
        } else {
            if flipped == true && counter1 == startingCard.count-2 {
                counter1 = 1
            } else if flipped == false && counter2 == startingCard.count-1 {
                counter2 = 2
            } else if flipped == false && counter2 == startingCard.count-2 {
                counter2 = 1
            } else if flipped == true && counter1 == startingCard.count-1 {
                counter1 = 2
            }
        }
        flip += 180
        flipped.toggle()
        alert = false
    }
    
    func BotonInfo() {
        showInfo.toggle()
        
        if showConfig == true {
            showConfig = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
