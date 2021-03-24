//
//  Checkmark.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 30/12/2020.
//

import SwiftUI

struct Checkmark: View {

    @State var isOn = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .fill(darkGreen)
                    .opacity(isOn ? 1 : 0.6)
                    .animation(.easeIn)

                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: geo.size.width - 20, height: geo.size.height - 20)
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundColor(darkGreen)
                    .opacity(isOn ? 1 : 0)
                    .animation(.easeIn)
            }.onTapGesture {
                checkmark()
            }.opacity(0)
        }
    }

    func checkmark() {
        isOn.toggle()
    }
}

struct CheckmarkContentView: View {

    var body: some View {
        ZStack {
            darkGray
                .edgesIgnoringSafeArea(.all)

            Checkmark()
                .frame(width: 50, height: 50)
        }
    }
}

struct Checkmark_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkContentView()
            .previewDevice("iPhone 12")
    }
}
