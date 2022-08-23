//
//  TypingIcon.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 3/8/22.
//

import SwiftUI

struct TypingIcon: View {
    
    @State private var isTyping: Bool = true
    private let bubbleAnimation: Animation = .spring(response: 1.5,
                                                     dampingFraction: 0.8,
                                                     blendDuration: 0).repeatForever(autoreverses: true)
    
    var body: some View {
        ZStack {
            Image(systemName: "bubble.left.fill")
                .resizable()
                .foregroundColor(clearGray.opacity(0.3))
                .scaleEffect(isTyping ? 1 : 0.95)
            
            HStack {
                TypingCircle(delay: 0.0)
                
                TypingCircle(delay: 0.5)
                
                TypingCircle(delay: 1.0)
            }
            .scaleEffect(isTyping ? 1 : 0.95)
            .padding(.horizontal, 15)
        }
        .onAppear() {
            animateBubble()
        }
    }
    
    func animateBubble() {
        withAnimation(bubbleAnimation) {
            isTyping.toggle()
        }
    }
}

struct TypingCircle: View {
    
    @State private var typing = true
    var delay: CGFloat
    
    var body: some View {
        Circle()
            .fill(.gray)
            .opacity(typing ? 0.3 : 0.7)
            .animation(.default.delay(delay))
            .onAppear { animate() }
    }
    
    func animate() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            typing.toggle()
        }
    }
}

struct TypingIcon_Previews: PreviewProvider {
    static var previews: some View {
        TypingIcon()
            .frame(width: 150, height: 150)
    }
}
