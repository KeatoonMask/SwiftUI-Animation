//
//  Color+Extensions.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 17/11/22.
//

import Foundation
import SwiftUI

let lightSecondaryColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
let darkSecondaryColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)

extension Color {
    static var primaryColor: Color {
        Color(UIColor { $0.userInterfaceStyle == .light ? .black : .white })
    }

    static var secondaryColor: Color {
        Color(UIColor { $0.userInterfaceStyle == .light ? lightSecondaryColor : darkSecondaryColor })
    }
}
