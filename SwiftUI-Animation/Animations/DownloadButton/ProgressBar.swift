//
//  ProgressBar.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 28/12/2020.
//

import SwiftUI

struct ProgressBar: View {

    @Binding var progress: CGFloat

    private var barColor: Color
    private var animationTime: TimeInterval = 0.3

    public init(initialProgress: Binding<CGFloat>, color: Color) {
        self._progress = initialProgress
        self.barColor = color
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(barColor.opacity(0.3))

                Rectangle()
                    .fill(barColor)
                    .frame(width: min(geo.size.width, geo.size.width * progress))
            }.cornerRadius(45.0)
        }
    }
}

struct ProgressBarContentView: View {
    @State var progressValue: CGFloat = 0.0

    var body: some View {
        ZStack {
            ProgressBar(initialProgress: $progressValue, color: darkGreen)
                .frame(height: 20)
        }.padding()
    }

    func startProgressBar() {
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
            self.progressValue += 0.1
        }
    }

    func resetProgressBar() {
        self.progressValue = 0.0
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarContentView()
    }
}
