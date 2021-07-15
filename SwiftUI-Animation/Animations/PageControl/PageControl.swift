//
//  PageControl.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 7/7/21.
//

import SwiftUI

struct PageControl: View {

    @Binding var selectedPage: Int

    var pages: Int
    var circleDiameter: CGFloat
    var circleMargin: CGFloat

    private var circleRadius: CGFloat { circleDiameter / 2}
    private var pageIndex: CGFloat { CGFloat(selectedPage - 1) }

    private var currentPosition: CGFloat {
        // Get the first circle position
        let stackWidth = circleDiameter * CGFloat(pages) + circleMargin * CGFloat(pages - 1)
        let halfStackWidth = stackWidth / 2
        let iniPosition = -halfStackWidth + circleRadius

        // Calculate the distance to get the next circle
        let distanceToNextPoint = circleDiameter + circleMargin

        // Use the pageIndex to get the current position
        return iniPosition + (pageIndex * distanceToNextPoint)
    }

    var body: some View {
        ZStack {
            // Total number of pages
            HStack(spacing: circleMargin) {
                ForEach(0 ..< pages) { _ in
                    Circle()
                        .stroke(Color.black, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                        .frame(width: circleDiameter, height: circleDiameter)
                }
            }

            // Current page index
            Circle()
                .foregroundColor(.black)
                .frame(width: circleDiameter, height: circleDiameter)
                .offset(x: currentPosition)
                .animation(.linear(duration: 0.3))
        }
    }
}

struct PageControlPreview: View {

    var pages: Int = 5
    @State var selectedPage: Int = 1

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    selectedPage = selectedPage - 1
                }, label: {
                    Image(systemName: "arrow.left.square.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                })

                Button(action: {
                    selectedPage = selectedPage + 1
                }, label: {
                    Image(systemName: "arrow.right.square.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                })
            }

            PageControl(selectedPage: $selectedPage, pages: pages, circleDiameter: 15.0, circleMargin: 10.0)
        }
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControlPreview()
    }
}
