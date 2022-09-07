//
//  ReactionView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 6/9/22.
//

import SwiftUI

struct ReactionView: View {

    var iconSize: CGFloat
    @State private var showReaction = false

    private let animation: Animation = .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 6)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(darkGray)
                .frame(width: iconSize * 5 + 140, height: iconSize + 30)
                .scaleEffect(showReaction ? 1 : 0, anchor: .center)
                .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10), value: showReaction)

            HStack(spacing: 20) {
                Image(uiImage: "👍".textToImage())
                    .rotationEffect(.degrees(showReaction ? 0 : -45))
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                    .animation(animation.delay(0.3), value: showReaction)

                Image(uiImage: "👎".textToImage())
                    .rotationEffect(.degrees(showReaction ? 0 : -45))
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                    .animation(animation.delay(0.3), value: showReaction)

                Image(uiImage: "❤️".textToImage())
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                    .animation(animation.delay(0.3), value: showReaction)

                Image(uiImage: "😂".textToImage())
                    .offset(x: showReaction ? 0 : 40)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                    .animation(animation.delay(0.3), value: showReaction)

                ReactionIconView(icon: "😠", show: $showReaction)
            }
            .onAppear{
                showReaction.toggle()
        }
        }
    }
}

struct ReactionIconView: View {

    var icon: String
    @Binding var show: Bool

    private var iconImage: UIImage { icon.textToImage() }
    private let animation: Animation = .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 6)

    var body: some View {
        Image(uiImage: iconImage)
            .offset(x: show ? 0 : 40)
            .scaleEffect(show ? 1 : 0, anchor: .bottomLeading)
            .animation(animation.delay(0.3), value: show)
    }
}

struct ReactionView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionView(iconSize: 44)
    }
}

extension String {
    func textToImage() -> UIImage {
        let nsString = (self as NSString)
        let font = UIFont.systemFont(ofSize: 44) // you can change your font size here
        let stringAttributes = [NSAttributedString.Key.font: font]
        let imageSize = nsString.size(withAttributes: stringAttributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
        UIColor.clear.set() // clear background
        UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
        nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
        let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
        UIGraphicsEndImageContext() //  end image context

        return image ?? UIImage()
    }
}
