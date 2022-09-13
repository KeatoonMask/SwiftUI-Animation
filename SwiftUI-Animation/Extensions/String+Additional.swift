//
//  String+Additional.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 13/9/22.
//

import Foundation
import UIKit

extension String {
    func textToImage() -> UIImage {
        let nsString = (self as NSString)
        let font = UIFont.systemFont(ofSize: 44) // you can change your font size here
        let stringAttributes = [NSAttributedString.Key.font: font]
        let imageSize = nsString.size(withAttributes: stringAttributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
        UIColor.clear.set() // clear background
        UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
        nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
        let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
        UIGraphicsEndImageContext() //  end image context

        return image ?? UIImage()
    }
}
