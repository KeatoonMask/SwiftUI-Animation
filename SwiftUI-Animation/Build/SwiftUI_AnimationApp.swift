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

                VStack {
                    SearchBar()
                        .padding(.top, 44)

                    Spacer()
                }
            }
        }
    }
}
