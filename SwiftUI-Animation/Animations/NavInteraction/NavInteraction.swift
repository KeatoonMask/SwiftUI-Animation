//
//  NavInteraction.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 10/4/23.
//

import SwiftUI

struct NavInteractionItem: View {

    private let animation: Animation = .interpolatingSpring(mass: 0.5, stiffness: 100, damping: 6)
    
    @Binding var isSelected: Bool
    var image: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: isSelected ? 80 : 50, height: 50)
                .animation(animation, value: isSelected)
                .foregroundColor(.white)
                .opacity(isSelected ? 0.5 : 1)


            Image(systemName: image)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(isSelected ? .white : .gray)
                .animation(animation, value: isSelected)
        }
    }
}

struct NavInteraction: View {

    @State private var isSelected = [true, false, false, false]
    @State private var navColor = darkBlue

    private var colors: [Color] = [darkBlue, darkPink, darkGray, darkViolet]
    private var image = ["person.fill", "magnifyingglass", "heart.fill", "gearshape.fill"]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 300, height: 70)
                .foregroundColor(navColor)

            HStack {
                ForEach(0..<4) { i in
                    NavInteractionItem(isSelected: $isSelected[i], image: image[i])
                        .onTapGesture {
                            select(item: i)
                        }
                }
            }
        }
        .animation(.linear(duration: 0.1))

    }

    func select(item: Int) {
        navColor = colors[item]
        isSelected = [false, false, false, false]
        isSelected[item] = true
    }
}

struct NavInteraction_Previews: PreviewProvider {
    static var previews: some View {
        NavInteraction()
    }
}
