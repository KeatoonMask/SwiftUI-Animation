//
//  SpinnerView.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 07/12/2020.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.5)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(Angle.degrees(180))
        }.frame(width: 200, height: 200)
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
