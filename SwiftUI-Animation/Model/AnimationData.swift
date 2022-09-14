//
//  Animation.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 14/9/22.
//

import Foundation
import SwiftUI

struct AnimationData: Identifiable {
    var id: Int
    var name: String
    var image: String
    var view: String

    var iconImage: UIImage { image.textToImage() }
}
