//
//  YonuApp.swift
//  Yonu
//
//  Created by Jaime Castañeda on 14/02/22.
//

import SwiftUI

@main
struct YonuApp: App {
    
    @State var showLaunchScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                ZStack {
                    if showLaunchScreen == true {
                        PantallaCarga(showLaunchScreen: $showLaunchScreen)
                            .transition(.opacity)
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
