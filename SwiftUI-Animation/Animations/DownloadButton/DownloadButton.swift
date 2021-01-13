//
//  DownloadButton.swift
//  SwiftUI-Animation
//
//  Created by Finsi Ennes on 13/12/2020.
//

import SwiftUI

enum DownloadStatus {
    case ready
    case started
    case finished
}

struct DownloadButton: View {

    @State private var status: DownloadStatus = .ready

    @State var progress: CGFloat = 0.0

    private var progressBarWidth: CGFloat = 250
    private var animationTime: TimeInterval = 0.3
    private var progressBarAnimationTime: TimeInterval = 2.4

    var body: some View {
        ZStack {
            darkGray
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 2) {
                Text("Open file")
                    .font(.title)
                    .foregroundColor(darkBlue)
                    .opacity((status == .finished) ? 1 : 0)
                    .animation(.easeOut(duration: animationTime))

                ZStack {
                    ProgressBar(initialProgress: $progress, color: darkBlue)
                        .frame(height: (status == .ready) ? 80 : 12)
                        .animation(.easeIn(duration: animationTime))
                    
                    Text("Download")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                        .opacity((status == .ready) ? 1 : 0)
                        .animation(.easeOut(duration: animationTime - 0.1))
                }
                .frame(width: (status == .finished) ? 150 : progressBarWidth)
                .onTapGesture {
                    download()
                }
            }
        }
    }

    func download() {
        // Download starts
        status = .started

        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            self.progress += 0.1
            if self.progress >= 1.0 {
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                    status = .finished
                }
            }
        }
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButton()
    }
}
