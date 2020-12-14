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

    static public var width: CGFloat = 250

    @State private var runCount = 0

    @State private var isDownloading = false
    @State private var isDownloaded = false
    @State private var downloadDuration: TimeInterval = 1.2

    @State private var status: DownloadStatus = .ready

    @State var progressBarWidth: CGFloat = 0


    var body: some View {
        VStack {
            Text("Open file")
                .opacity(isDownloaded ? 1 : 0)
                .animation(.easeOut(duration: 0.45))

            // Progress Bar
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(Color.gray)
                    .frame(height: (status == .ready) ? 80 : 12)
                    .animation(.easeIn(duration: 0.4))

                HStack {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color.blue)
                        .frame(width: progressBarWidth, height: 12)
                        .animation(.linear(duration: 0.5))

                    Spacer()
                }

                Text("Download")
                    .opacity((status == .ready) ? 1 : 0)
                    .animation(.easeOut(duration: 0.4))
            }.frame(width: 250)
            .onTapGesture {
                download()
            }

        }
    }

    func download() {
        // Download starts
        status = .started
        withAnimation {
            self.isDownloading.toggle()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                runCount += 1
                progressBarWidth = (25 * CGFloat(runCount) * DownloadButton.width) / 100

                if runCount == 4 {
                    status = .finished
                }
            }
        }
    }
}

struct ProgressBar: View {

    var height: CGFloat
    var progress: Int = 0

    var progressBarWidth: CGFloat {
        guard isOn else { return 0.0 }
        return (CGFloat(progress) * DownloadButton.width) / 100
    }

    @State private var isOn = false

    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(Color.gray)
                    .frame(height: isOn ? 12 : 80)

                HStack {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color.blue)
                        .frame(width: progressBarWidth, height: 12)

                    Spacer()
                }

                Text("Download")
                    .opacity(isOn ? 0 : 1)
                    .animation(.easeOut(duration: 0.45))
            }
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButton()
    }
}
