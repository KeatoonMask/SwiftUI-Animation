//
//  BatteryView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 10/11/22.
//

import SwiftUI

struct BatteryView: View {

    @Binding public var isCharging: Bool

    @State private var progress: CGFloat = 0
    @State private var batteryColor: Color = .red

    public let width: CGFloat
    private var height: CGFloat { width / 3 }

    private var minBatt: CGFloat { width * 0.1 }
    private var maxBatt: CGFloat { width * 0.75 }
    private var batteryMargin: CGFloat { width * 0.6 }

    private var componentOffset: CGFloat { -width * 0.055 }

    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "battery.0")
                    .resizable()
                    .frame(width: width, height: height)

                HStack {
                    Spacer()
                        .frame(width: batteryMargin)

                    RoundedRectangle(cornerRadius: 16.0)
                        .frame(width: progress, height: height * 0.65)
                        .foregroundColor(batteryColor)
                        .offset(x: componentOffset)

                    Spacer()
                }

                BoltView(size: width)
                    .opacity(isCharging ? 1.0 : 0.0)
                    .animation(.linear(duration: 0.4))
                    .offset(x: componentOffset)
            }
            .onChange(of: self.isCharging) { newValue in
                withAnimation(.easeOut(duration: 3)) {
                    progress = newValue ? maxBatt : minBatt
                    batteryColor = newValue ? .green : .red
                }
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
    @State private var isCharging = false

    var body: some View {
        VStack(spacing: 40) {
            BatteryView(isCharging: $isCharging, width: 200)

            VStack(spacing: 10) {
                Toggle(isOn: $isCharging){}
                    .toggleStyle(CustomToggleStyle())

                Text("CHARGE")
                    .font(.system(size:15))
                    .fontWeight(.light)
                    .foregroundColor(.black)
            }
        }
    }
}  

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryViewContainer()
    }
}
