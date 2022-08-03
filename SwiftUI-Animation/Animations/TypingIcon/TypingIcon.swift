//
//  TypingIcon.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 3/8/22.
//

import SwiftUI

struct TypingIcon: View {
    
    @State private var typing = true
    @State private var typingg = true
    @State private var typinggg = true
    
    let animation: Animation = .spring(response: 0.55,
                                       dampingFraction: 0.825,
                                       blendDuration: 0).repeatForever(autoreverses: true)
    
    var body: some View {
        HStack {
            Circle()
                .fill(.gray)
                .opacity(typing ? 0.3 : 0.7)
                .animation(.default)
            
            Circle()
                .fill(.gray)
                .opacity(typing ? 0.3 : 0.7)
                .animation(.default.delay(0.5))
            
            Circle()
                .fill(.gray)
                .opacity(typing ? 0.3 : 0.7)
                .animation(.default.delay(1.0))
        }
        .onAppear {
            animateTyping()
        }
    }
    
    func animateTyping() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            typing.toggle()
        }
        
    }
}

struct TypingIcon_Previews: PreviewProvider {
    static var previews: some View {
        TypingIcon()
    }
}
