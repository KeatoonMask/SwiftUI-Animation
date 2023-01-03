//
//  SwiftUI_AnimationApp.swift
//  SwiftUI-Animation
//
//  Created by Finsi Ennes on 24/11/2020.
//

import SwiftUI

@main
struct SwiftUI_AnimationApp: App {
    var body: some Scene {
        WindowGroup {
            //AnimationListView(animationList: MockAnimationService().animationList())
            Checkmark()
                .frame(width: 50, height: 50)
        }
    }
}
