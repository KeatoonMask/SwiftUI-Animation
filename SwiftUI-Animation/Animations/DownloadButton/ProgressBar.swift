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
                // Main Bar
                Rectangle()
                    .fill(barColor.opacity(0.3))

                // Progress Bar
                Rectangle()
                    .fill(barColor)
                    .frame(width: min(geo.size.width, geo.size.width * progress))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

struct ProgressBarContentView: View {
    @State var progress: CGFloat = 0.0

    var body: some View {
        VStack {
            ProgressBar(initialProgress: $progress, color: .green)
                .frame(height: 20)
                .padding()

            Button(action: { self.start() }) {
                Text("Start")
            }
        }
    }

    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            self.progress += 0.1
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarContentView()
    }
}
