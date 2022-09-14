//
//  AnimationList.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 14/9/22.
//

import SwiftUI

struct AnimationListView: View {

    var animations: [AnimationData]

    var body: some View {
        NavigationView {
            List(animations) { animation in
                NavigationLink(destination: Spinner()) {
                    AnimationCell(animation: animation)
                }
            }
            .navigationBarTitle("Animations")
        }
    }
}

struct AnimationListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationListView(animations: [AnimationData(id: 1, name: "Spinner", image: "🔁", view: "Spinner"),
                                       AnimationData(id: 2, name: "Progress Bar", image: "📶", view: "Spinner"),
                                       AnimationData(id: 3, name: "Order Button", image: "📦", view: "Spinner"),
                                       AnimationData(id: 4, name: "Checkmark", image: "✅", view: "Spinner"),
                                       AnimationData(id: 5, name: "Password", image: "🫣", view: "Spinner")])
    }
}

