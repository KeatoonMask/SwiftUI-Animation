//
//  NavInteraction.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 10/4/23.
//

import SwiftUI

struct NavInteractionItem: View {

    private let itemSize: CGFloat = 50
    private let animation: Animation = .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 6)
    
    @Binding
    var isSelected: Bool
    var image: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: isSelected ? 80 : itemSize, height: itemSize)
                .animation(animation, value: isSelected)
                .foregroundColor(.white)
                .opacity(isSelected ? 0.3 : 1)


            Image(systemName: image)
                .resizable()
                .frame(width: itemSize/2, height: itemSize/2)
                .foregroundColor(isSelected ? .white : clearGray)
                .animation(animation, value: isSelected)
        }
    }
}

struct NavInteraction: View {

    private let colors: [Color] = [darkBlue, darkPink, darkGreen, darkViolet]
    private let image = ["person.fill", "magnifyingglass", "heart.fill", "gearshape.fill"]

    @State private var isSelected = [true, false, false, false]
    @State private var navColor = darkBlue

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 300, height: 70)
                .foregroundColor(navColor)

            HStack {
                ForEach(0..<4) { i in
                    NavInteractionItem(isSelected: $isSelected[i], image: image[i])
                        .onTapGesture {
                            select(itemIndex: i)
                        }
                }
            }
        }
        .animation(.linear(duration: 0.1))

    }

    func select(itemIndex: Int) {
        navColor = colors[itemIndex]
        isSelected = isSelected.enumerated().map { (i, _) in
            itemIndex == i
        }
    }
}

struct NavInteraction_Previews: PreviewProvider {
    static var previews: some View {
        NavInteraction()
    }
}
