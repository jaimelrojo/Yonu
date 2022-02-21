//
//  Blur.swift
//  Yonu
//
//  Created by Jaime Castañeda on 14/02/22.
//

import SwiftUI

struct Blur: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView (_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
