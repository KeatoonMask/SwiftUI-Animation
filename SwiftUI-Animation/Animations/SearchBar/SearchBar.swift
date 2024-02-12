//
//  SearchBar.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 23/10/23.
//

import SwiftUI

struct SearchBar: View {

    @State private var isSelected = false
    @State private var query: String = ""
    @FocusState private var emailFieldIsFocused: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40, style: .circular)
                .frame(width: isSelected ? 320 : 60, height: 60)
                .foregroundColor(.white)
                .shadow(radius: 5)

            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
                .opacity(isSelected ? 0 : 1)
                .animation(.linear(duration: isSelected ? 0.1 : 0.3), value: isSelected)

            TextField(
                "Search...",
                text: $query
            )
            .focused($emailFieldIsFocused)
            .opacity(isSelected ? 1 : 0)
            .animation(.linear(duration: isSelected ? 0.3 : 0.1)
                .delay(isSelected ? 0.3 : 0), value: isSelected)
            .padding(.horizontal, 60)

            HStack {
                Spacer()
                    .frame(width: 240)

                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .opacity(isSelected ? 1 : 0)
                    .animation(.linear(duration: isSelected ? 0.3 : 0.1), value: isSelected)
            }
        }
        .animation(.linear(duration: 0.3), value: isSelected)
        .onTapGesture {
            isSelected.toggle()
            emailFieldIsFocused = isSelected
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            darkGray.edgesIgnoringSafeArea(.all)

            VStack {
                SearchBar()
                    .padding(.top, 44)

                Spacer()
            }
        }
    }
}
