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
                clearBlue.edgesIgnoringSafeArea(.all)
                PasswordField()
                    .frame(width: 300)
                    .padding(.top, 40)
            }
        }
    }
}
