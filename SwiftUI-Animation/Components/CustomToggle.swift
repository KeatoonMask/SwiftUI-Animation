//
//  CustomToggle.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 17/11/22.
//

import SwiftUI

struct CustomToggle: View {
    @State private var showAdvanced = true

    var body: some View {
        Toggle(isOn: $showAdvanced){}
            .toggleStyle(CustomToggleStyle())
            .padding()
    }
}

struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CustomToggle().preferredColorScheme($0)
        }
    }
}

let customToggleOnColor = Color(red: 80/255, green: 190/255, blue: 90/255)

struct CustomToggleStyle: ToggleStyle {
    @State private var animationTime = 0.0

    func makeBody(configuration: Configuration) -> some View {
        Rectangle()
            .foregroundColor(configuration.isOn ? customToggleOnColor : .secondaryColor)
            .frame(width: 51, height: 31, alignment: .center)
            .overlay(
                Circle()
                    .foregroundColor(.white)
                    .padding(3)
                    .offset(x: configuration.isOn ? 11 : -11, y: 0)
                    .animation(Animation.linear(duration: animationTime))

            )
            .cornerRadius(20)
            .onTapGesture { configuration.isOn.toggle() }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
                    self.animationTime = 0.1
                }
            }
    }
}
