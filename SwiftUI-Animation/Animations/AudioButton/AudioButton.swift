//
//  AudioButton.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 26/04/2021.
//

import SwiftUI

struct AudioButton: View {

    @State private var curve: CGFloat = 100
    
    var body: some View {
        Bezier(curve: curve)
            .trim(from: 0.0, to: 0.8)
            .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round))
            .animation(Animation.linear(duration: 0.1))

    }
}

struct Bezier: Shape {
    var curve: CGFloat
    
    func path(in rect: CGRect) -> Path
    {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: curve, y: 0), control: CGPoint(x: curve / 2, y: curve / 2))
        return path
    }
}

struct AudioButton_Previews: PreviewProvider {
    static var previews: some View {
        AudioButton()
            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
