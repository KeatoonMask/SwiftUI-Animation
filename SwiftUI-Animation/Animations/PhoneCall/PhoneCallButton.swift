//
//  PhoneCallButton.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 20/7/22.
//

import SwiftUI

struct PhoneCallButton: View {
    
    let size: CGFloat
    
    private var doubleSize: CGFloat { size * 2.0 }
    
    private var expandedSize: CGFloat { size * 2.6363 }
    
    @State private var isRing: Bool = true
    @State private var ringing = false
    
    @State private var shadowColor: Color = .clear
    @State private var phoneDegrees: Angle = .degrees(0)
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.gray)
                .frame(width: doubleSize, height: doubleSize)
                .scaleEffect(ringing ? 1 : 0.5)
                .opacity(ringing ? 0.3 : 0)
            
            RoundedRectangle(cornerRadius: 100.0)
                .fill(isRing ? .black : .red)
                .frame(width: isRing ? size : expandedSize, height: size)
                .shadow(color: shadowColor, radius: 5, x: 0, y: 8)
                .animation(.linear)
            
            Button(action: {
                isRing.toggle()
            }, label: {
                HStack {
                    if !isRing {
                        Text("END")
                            .font(.system(size: size * 0.5, weight: .bold))
                            .foregroundColor(.white)
                            .animation(.linear)
                    }
                    
                    Image(systemName: "phone.down.fill")
                        .resizable()
                        .frame(width: size * 0.636363, height: size * 0.272727)
                        .foregroundColor(.white)
                        .rotationEffect(phoneDegrees)
                        .animation(.linear)
                }
            })
            .onChange(of: isRing) { newValue in
                withAnimation(.linear(duration: 0.3)) {
                    shadowColor = newValue ? .clear : clearGray
                    phoneDegrees = newValue ? .degrees(0) : .degrees(130)
                    animateRing()
                }
            }
        }
        .onAppear {
            animateRing()
        }
    }
    
    func animateRing() {
        if isRing {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0).repeatForever(autoreverses: true)) {
                ringing.toggle()
            }
        } else {
            ringing = false
        }
    }
}

struct PhoneCallButton_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCallButton(size: 44.0)
    }
}
