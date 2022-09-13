//
//  ReactionView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 6/9/22.
//

import SwiftUI

struct ReactionView: View {

    @Binding var showView: Bool

    private let lightBackground = Color(red: 240/255, green: 240/255, blue: 245/255)
    private let containerWidth: CGFloat = (44 * 5) + (20 * 6) // Width of 5 icons + Horizontal margins
    private let containerHeight: CGFloat = 44 + 30 // Icon height + 15px for top and bottom margins

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: containerWidth, height: containerHeight)
                .foregroundColor(lightBackground)
                .scaleEffect(showView ? 1 : 0, anchor: .center)
                .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10).delay(showView ? 0 : 0.3), value: showView)

            HStack(spacing: 20) {
                ReactionIconView(icon: "👍", $showView, degrees: -45)

                ReactionIconView(icon: "👎", $showView, degrees: -45)

                ReactionIconView(icon: "❤️", $showView)

                ReactionIconView(icon: "😂", $showView, offset: 40)

                ReactionIconView(icon: "😠", $showView, offset: 40)
            }
        }
    }
}

struct ReactionIconView: View {

    var icon: String
    var degrees: Double
    var offset: CGFloat
    
    @Binding var showView: Bool

    private var iconImage: UIImage { icon.textToImage() }
    private let animation: Animation = .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 6)

    public init(icon: String,
                _ show: Binding<Bool>,
                degrees: Double = 0,
                offset: CGFloat = 0.0) {
        self.icon = icon
        self.degrees = degrees
        self.offset = offset
        self._showView = show
    }

    var body: some View {
        Image(uiImage: iconImage)
            .rotationEffect(.degrees(showView ? 0 : degrees))
            .offset(x: showView ? 0 : offset)
            .scaleEffect(showView ? 1 : 0)
            .animation(showView ? animation.delay(showView ? 0.3 : 0) : Animation.linear, value: showView)
    }
}

struct ReactionViewContainer: View {
    @State private var showReaction = false

    var body: some View {
        VStack(spacing: 20) {
            ReactionView(showView: $showReaction)

            Button(action: {
                showReaction.toggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12.0)
                        .frame(width: 80, height: 70, alignment: .center)
                        .foregroundColor(darkGreen)

                    Image(systemName: "power")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ReactionView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionViewContainer()
    }
}
