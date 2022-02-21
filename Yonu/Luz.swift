//
//  Luz.swift
//  Yonu
//
//  Created by Jaime Castañeda on 14/02/22.
//

import SwiftUI

struct Luz: View {
    
    let width: Double
    let degrees: Double
    let color: Color
    let offset: Double
    
    var body: some View {
        Rectangle()
            .padding(.horizontal, width)
            .padding(.vertical, -1000)
            .rotationEffect(.degrees(degrees))
            .foregroundColor(color)
            .shadow(color: color, radius: 8)
            .offset(x: offset)
            .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 5))
    }
}

//struct Luz_Previews: PreviewProvider {
//    static var previews: some View {
//        Luz()
//    }
//}
