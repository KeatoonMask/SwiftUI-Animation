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
        AnimationData(id: 2, name: "Progress Bar", image: "⬇️", view: .download),
        AnimationData(id: 3, name: "Order Button", image: "📦", view: .order),
        AnimationData(id: 4, name: "Checkmark", image: "✅", view: .checkmark),
        AnimationData(id: 5, name: "Password", image: "🫣", view: .password),
        AnimationData(id: 6, name: "Rec", image: "🎙", view: .rec),
        AnimationData(id: 7, name: "Like", image: "❤️", view: .like),
        AnimationData(id: 8, name: "Audio", image: "🔊", view: .audio),
        AnimationData(id: 9, name: "Stopwatch", image: "⏱", view: .stopwatch),
        AnimationData(id: 10, name: "Page Control", image: "⚫️", view: .page),
        AnimationData(id: 11, name: "Phone Call", image: "📞", view: .phone),
        AnimationData(id: 12, name: "Typing", image: "💬", view: .typing),
        AnimationData(id: 13, name: "Reaction", image: "😂", view: .reaction),
        AnimationData(id: 14, name: "Battery", image: "🔋", view: .battery)
    ]

    func animationList() -> AnimationList {
        AnimationList(animations: animations)
    }
}
