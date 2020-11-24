//
//  Spinner.swift
//  SwiiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 24/11/2020.
//

import SwiftUI

struct Spinner: View {
    let circleTrackGradient = LinearGradient(gradient: .init(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .bottomLeading)
    let circleRoundGradient = LinearGradient(gradient: .init(colors: [Color.yellow, Color.blue]), startPoint: .topLeading, endPoint: .trailing)

    let trackerRotation: Double = 2
    let animationDuration: Double = 0.75

    @State var isAnimating: Bool = false
    @State var circleStart: CGFloat = 0.0
    @State var circleEnd: CGFloat = 0.03

    @State var rotationDegree: Angle = Angle.degrees(270)

    var body: some View {
        ZStack {
            Circle()
                .trim(from: circleStart, to: circleEnd)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .fill(Color.blue)
                .rotationEffect(self.rotationDegree)
        }.frame(width: 200, height: 200)
        .onAppear() {
            //self.animateLoader()
            Timer.scheduledTimer(withTimeInterval: self.trackerRotation * self.animationDuration + (self.animationDuration), repeats: true) { (mainTimer) in
                self.animateLoader()
            }
        }
    }

    // MARK:- functions
    func getRotationAngle() -> Angle {
        return .degrees(360)
    }

    func animateLoader() {
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
            withAnimation(Animation.easeOut(duration: self.animationDuration)) {
                self.circleEnd = 1.0
            }
        }

        Timer.scheduledTimer(withTimeInterval: trackerRotation * animationDuration * 0.985, repeats: false) { _ in
            withAnimation(Animation.easeOut(duration: self.animationDuration)) {
                self.rotationDegree += self.getRotationAngle()
            }
        }

        Timer.scheduledTimer(withTimeInterval: trackerRotation * animationDuration, repeats: false) { _ in
            withAnimation(Animation.easeOut(duration: self.animationDuration)) {
                self.circleEnd = 0.03
            }
        }
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner()
    }
}
