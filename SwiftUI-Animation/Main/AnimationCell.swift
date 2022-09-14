//
//  AnimationCell.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 14/9/22.
//

import SwiftUI

struct AnimationCell: View {

    var animation: AnimationData

    var body: some View {
        HStack {
            Image(uiImage: animation.iconImage)
                .resizable()
                .frame(width: 32, height: 32)
            
            Text(animation.name)
        }
    }
}

struct AnimationCell_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCell(animation: AnimationData(id: 1, name: "Spinner", image: "🔁", view: "Spinner"))
    }
}
