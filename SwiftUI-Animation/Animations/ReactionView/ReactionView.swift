//
//  ReactionView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 6/9/22.
//

import SwiftUI

struct ReactionView: View {

    @Binding var showReaction: Bool

    let lightBackground = Color(red: 240/255, green: 240/255, blue: 245/255)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 44 * 5 + 140, height: 44 + 30)
                .foregroundColor(lightBackground)
                .scaleEffect(showReaction ? 1 : 0, anchor: .center)
                .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10).delay(showReaction ? 0 : 0.3), value: showReaction)

            HStack(spacing: 20) {
                ReactionIconView(icon: "👍", show: $showReaction, degrees: -45)

                ReactionIconView(icon: "👎", show: $showReaction, degrees: -45)

                ReactionIconView(icon: "❤️", show: $showReaction)

                ReactionIconView(icon: "😂", show: $showReaction, offset: 40)

                ReactionIconView(icon: "😠", show: $showReaction, offset: 40)
            }
        }
    }
}

struct ReactionIconView: View {

    var icon: String
    var degrees: Double
    var offset: CGFloat
    
    @Binding var show: Bool

    private var iconImage: UIImage { icon.textToImage() }
    private let animation: Animation = .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 6)


    public init(icon: String,
                show: Binding<Bool>,
                degrees: Double = 0,
                offset: CGFloat = 0.0) {
        self.icon = icon
        self.degrees = degrees
        self.offset = offset
        self._show = show
    }

    var body: some View {
        Image(uiImage: iconImage)
            .rotationEffect(.degrees(show ? 0 : degrees))
            .offset(x: show ? 0 : offset)
            .scaleEffect(show ? 1 : 0)
            .animation(show ? animation.delay(show ? 0.3 : 0) : Animation.linear, value: show)
    }
}

struct ReactionViewContainer: View {
    @State private var showReaction = false

    var body: some View {
        VStack(spacing: 20) {
            ReactionView(showReaction: $showReaction)

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
