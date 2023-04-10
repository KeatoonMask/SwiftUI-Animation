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

    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .frame(width: isSelected ? 100 : 50, height: 50)
            .foregroundColor(.gray)
            .animation(animation, value: isSelected)
    }
}

struct NavInteraction: View {

    @State private var isSelected = [true, false, false, false]

    var body: some View {
        HStack {
            ForEach(0..<4) { i in
                NavInteractionItem(isSelected: $isSelected[i])
                    .onTapGesture {
                        select(item: i)
                    }
            }
        }
        .animation(.linear(duration: 0.1))

    }

    func select(item: Int) {
        isSelected = [false, false, false, false]
        isSelected[item] = true
    }
}

struct NavInteraction_Previews: PreviewProvider {
    static var previews: some View {
        NavInteraction()
    }
}
