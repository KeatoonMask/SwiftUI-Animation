//
//  ReactionView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 6/9/22.
//

import SwiftUI

struct ReactionView: View {

    @State private var showReaction = false

    var body: some View {
        ZStack {
            Image(uiImage: "❤️".textToImage())
                .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 5), value: showReaction)
        }
        .onAppear{
            showReaction.toggle()
        }
    }
}

struct ReactionView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionView()
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
