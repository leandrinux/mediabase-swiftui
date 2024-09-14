//
//  Fonts.swift
//  mediabase
//
//  Created by Leandro on 05/09/2024.
//

import SwiftUI

enum FontSize: CGFloat {
    case title = 22
    case normal = 19
}

extension Font {
        
    static func primary(_ size: FontSize) -> Font {
        return .custom("NIKEARegular", size: size.rawValue)
    }

    static func secondary(_ size: FontSize) -> Font {
        return .custom("Futura-Medium", size: size.rawValue)
    }

}

extension UIFont {

    static func primary(_ size: FontSize) -> UIFont {
        return UIFont(name: "NIKEARegular", size: size.rawValue)!
    }

    static func secondary(_ size: FontSize) -> UIFont {
        return UIFont(name: "Futura-Medium", size: size.rawValue)!
    }

}
