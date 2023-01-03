//
//  RecButton.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 14/04/2021.
//

import SwiftUI

/*
 * RecButton animation: Note that this need to
 * be framed on a square for a proper performance
 */
struct RecButton: View {

    @State private var isRec = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: geo.size.height / 2)
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .fill(Color.primaryColor)

                RoundedRectangle(cornerRadius: cornerRadius(using: geo.size.width))
                    .fill(Color.red)
                    .frame(width: recIconSize(using: geo.size.width),
                           height: recIconSize(using: geo.size.height))
                    .animation(.easeOut(duration: 0.125))
                    .onTapGesture {
                        isRec.toggle()
                }
            }
        }
    }

    func cornerRadius(using size:CGFloat) -> CGFloat {
        if isRec {
            // 10% of height -> rounded square
            return size * 0.1
        } else {
            // 50% of height -> circle
            return size * 0.5
        }
    }

    func recIconSize(using size: CGFloat) -> CGFloat {
        isRec ? size * 0.5 : size - (size * 0.18)
    }
}

struct RecButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            darkGray.edgesIgnoringSafeArea(.all)
            
            RecButton()
                .frame(width: 100, height: 100)

        }
    }
}
