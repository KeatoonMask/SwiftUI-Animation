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
    case like
    case download
    case password
    case checkmark
    case order
    case rec
    case typing
    case page
    case phone
    case reaction
    case battery
    case stopwatch
    case audio
}
struct AnimationData: Identifiable {
    var id: Int
    var name: String
    var image: String
    var view: AnimationViewType

    var iconImage: UIImage { image.textToImage() }
}
