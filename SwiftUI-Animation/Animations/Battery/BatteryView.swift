//
//  BatteryView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 10/11/22.
//

import SwiftUI

struct BatteryView: View {

    public let percentage: CGFloat
    public let width: CGFloat

    private var batteryWidth: CGFloat {
        width * 0.725
    }

    private var batteryTrailing: CGFloat {
        let min = width * 0.6
        let max = width * 1.3
        let scale = max - min

        return min + (scale * (1.0 - percentage))
    }

    var body: some View {
        VStack {

            Image(systemName: "battery.100.bolt")
                .resizable()
                .frame(width: width, height: width / 3)

            ZStack {
                Image(systemName: "battery.0")
                    .resizable()
                    .frame(width: width, height: width / 3)

                HStack {
                    Spacer()
                        .frame(width: width * 0.6)

                    RoundedRectangle(cornerRadius: 16.0)
                        .frame(height: (width / 3) * 0.65)
                    .offset(x: -width * 0.055)

                    Spacer()
                        .frame(width: batteryTrailing) // 120 - 1.3
                }

                Image(systemName: "bolt")
                    .resizable()
                    .frame(width: width * 0.4, height: width * 0.36)
                    .foregroundColor(.white)
                    .font(Font.title.weight(.light))
                    .offset(x: -width * 0.055)
            }
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView(percentage: 0.75, width: 200)
    }
}
