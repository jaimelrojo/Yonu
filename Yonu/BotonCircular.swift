//
//  BotonCircular.swift
//  Yonu
//
//  Created by Jaime Castañeda on 23/02/22.
//

import SwiftUI

struct BotonCircular: View {
    
    let symbol: String
    let size: Double
    
    var body: some View {
        Blur(effect: UIBlurEffect(style: .dark))
            .mask(Image(systemName: symbol)
                    .resizable()
                    .scaledToFit()
            )
            .frame(width: UIScreen.main.bounds.width * size,
                   height: UIScreen.main.bounds.width * size)
    }
}

struct BotonCircular_Previews: PreviewProvider {
    static var previews: some View {
        BotonCircular(symbol: "xmark.circle.fill", size: 0.1)
    }
}
