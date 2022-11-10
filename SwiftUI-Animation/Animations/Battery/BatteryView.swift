//
//  BatteryView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 10/11/22.
//

import SwiftUI

struct BatteryView: View {

    public let width: CGFloat
    var body: some View {
        VStack {

            Image(systemName: "battery.100.bolt")
                .resizable()
                .frame(width: width, height: width / 3)

            ZStack {
                    Image(systemName: "battery.0")
                        .resizable()
                        .frame(width: width, height: width / 3)

                    RoundedRectangle(cornerRadius: 16.0)
                        .frame(width: width * 0.725, height: (width / 3) * 0.65)
                        .offset(x: -11)

                Image(systemName: "bolt")
                    .resizable()
                    .frame(width: width * 0.4, height: width * 0.36)
                    .foregroundColor(.white)
                    .font(Font.title.weight(.light))
                    .offset(x: -11)
            }
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView(width: 200)
    }
}
