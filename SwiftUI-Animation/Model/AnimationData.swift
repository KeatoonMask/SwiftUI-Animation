//
//  Animation.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 14/9/22.
//

import Foundation
import SwiftUI

enum AnimationViewType {
    case spinner
    case download
    case order
    case checkmark
    case password
    case rec
    case like
    case audio
    case stopwatch
    case page
    case phone
    case typing
    case reaction
    case battery
}
struct AnimationData: Identifiable {
    var id: Int
    var name: String
    var image: String
    var view: AnimationViewType

    var iconImage: UIImage { image.textToImage() }
}
