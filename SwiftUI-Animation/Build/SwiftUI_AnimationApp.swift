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
            ZStack {
                darkGray.edgesIgnoringSafeArea(.all)

                LikeButton()
                    .frame(width: 180, height: 100)

            }
        }
    }
}
