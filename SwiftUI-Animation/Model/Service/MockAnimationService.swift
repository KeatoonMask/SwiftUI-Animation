//
//  MockAnimationService.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 5/10/22.
//

import Foundation

class MockAnimationService: AnimationService {

    // MARK: Mock data
    private var animations: [AnimationData] = [
        AnimationData(id: 1, name: "Spinner", image: "🔁", view: .spinner),
        AnimationData(id: 2, name: "Like", image: "❤️", view: .like),
        AnimationData(id: 3, name: "Download button", image: "⬇️", view: .download),
        AnimationData(id: 4, name: "Password field", image: "🫣", view: .password),
        AnimationData(id: 5, name: "Checkmark", image: "✅", view: .checkmark),
        AnimationData(id: 6, name: "Order button", image: "📦", view: .order),
        AnimationData(id: 7, name: "Rec", image: "🎙", view: .rec),
        AnimationData(id: 8, name: "Typing", image: "💬", view: .typing),
        AnimationData(id: 9, name: "Page Control", image: "⚫️", view: .page),
        AnimationData(id: 10, name: "Phone Call", image: "📞", view: .phone),
        AnimationData(id: 11, name: "Reaction", image: "😂", view: .reaction),
        AnimationData(id: 12, name: "Battery", image: "🔋", view: .battery),
        AnimationData(id: 13, name: "Stopwatch", image: "⏱", view: .stopwatch),

    ]

    func animationList() -> AnimationList {
        AnimationList(animations: animations)
    }
}
