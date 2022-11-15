//
//  BatteryView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 10/11/22.
//

import SwiftUI

struct BatteryView: View {

    @Binding public var isCharging: Bool
    public let width: CGFloat

    private var height: CGFloat { width * 0.333 }

    private var batteryWidth: CGFloat {
        width * 0.725
    }

    private var batteryMargin: CGFloat { width * 0.6 }

    private var batteryOffset: CGFloat { -width * 0.055 }


    var body: some View {
        VStack {

            Image(systemName: "battery.100.bolt")
                .resizable()
                .frame(width: width, height: height)

            ZStack {
                Image(systemName: "battery.0")
                    .resizable()
                    .frame(width: width, height: width / 3)

                HStack {
                    Spacer()
                        .frame(width: batteryMargin)

                    RoundedRectangle(cornerRadius: 16.0)
                        .frame(width: isCharging ? width * 0.75 : width * 0.1, height: (width / 3) * 0.65)
                        .animation(.linear(duration: 2.5))
                        .offset(x: batteryOffset)

                    Spacer()
                }

                BoltView(size: width)
                    .opacity(isCharging ? 1.0 : 0.0)
                    .animation(.linear(duration: 0.3))
            }
        }
    }
}

struct BoltView: View {
    public let size: CGFloat

    private var width: CGFloat { size * 0.4 }
    private var height: CGFloat { size * 0.36 }

    var body: some View {
        ZStack {
            Image(systemName: "bolt.fill")
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(.black)
                .font(Font.title.weight(.light))

            Image(systemName: "bolt")
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(.white)
                .font(Font.title.weight(.light))
        }
    }
}

struct BatteryViewContainer: View {
    @State private var percentage: CGFloat = 0.4
    @State private var isCharging = false

    var body: some View {
        VStack {
            BatteryView(isCharging: $isCharging, width: 200)

            Button(action: {
                isCharging.toggle()
            }, label: {
                HStack {

                    RoundedRectangle(cornerRadius: 16.0)
                        .frame(height: 44)
                }
            })
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryViewContainer()
    }
}
