//
//  Boton.swift
//  Yonu
//
//  Created by Jaime Castañeda on 14/02/22.
//

import SwiftUI

struct Boton: View {
    
    let width: Double
    let height: Double
    let symbol: String
    
    var body: some View {
        Blur(effect: UIBlurEffect(style: .light))
            .frame(width: width,
                   height: height)
            .mask(Image(systemName: symbol)
                    .resizable()
                    .scaledToFit()
            )
            .padding(.horizontal, 20)
            .shadow(color: .black, radius: 20)
    }
}

//struct Boton_Previews: PreviewProvider {
//    static var previews: some View {
//        Boton()
//    }
//}
