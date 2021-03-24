//
//  MusicPlayer.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 13/01/2021.
//

import SwiftUI

struct MusicPlayer: View {
    @Namespace private var playerAnimation
    @State private var showsDetails = true
    @State private var showsControls = true

    @State var progress: CGFloat = 0.65

    var frame: CGFloat {
        showsDetails ? 300 : 75
    }

    var body: some View {
        VStack {
            Spacer()

            VStack {
                HStack {
                    Image("flumeCover")
                        .resizable()
                        .frame(width: frame, height: frame)
                        .padding(.top, showsDetails ? 180 : 0)

                    if !showsDetails {
                        VStack(alignment: .leading) {
                            Text("Stay Close")
                                .foregroundColor(.white)

                            Text("Flume")
                                .foregroundColor(.gray)
                        }
                        .font(.title2)
                        .matchedGeometryEffect(id: "AlbumTitle", in: playerAnimation)


                        Spacer()

                        Image(systemName: "play.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                }

                if showsDetails {
                    Spacer()
                        .frame(height: 44)

                    HStack {
                        Spacer()
                            .frame(width: 44)

                        VStack(alignment: .leading) {
                            Text("Stay Close")
                                .foregroundColor(.white)

                            Text("Flume")
                                .foregroundColor(.gray)
                        }
                        .font(.title2)
                        .matchedGeometryEffect(id: "AlbumTitle", in: playerAnimation)

                        Spacer()
                    }

                    VStack {
                        ProgressBar(initialProgress:$progress, color: .white)
                            .frame(height: 8)
                            .padding([.leading, .trailing], 44)

                        HStack {
                            Image(systemName: "arrow.left.to.line.alt")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding()

                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .padding()

                            Image(systemName: "arrow.right.to.line.alt")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }.opacity(showsControls ? 1 : 0)
                    .animation(.easeIn)
                    Spacer()
                }
            }
            .onTapGesture {
                showsControls.toggle()
                Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { timer in
                    withAnimation(.spring()) {
                        self.showsDetails.toggle()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: showsDetails ? UIScreen.screenHeight + 44 : 75)
            .background(darkGray)
        }
    }
}

struct MusicPlayerContentView: View {

    var body: some View {
        ZStack {
            darkBlack
                .edgesIgnoringSafeArea(.all)

            MusicPlayer()
        }
    }
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerContentView()
            .previewDevice("iPhone 12")
    }
}
