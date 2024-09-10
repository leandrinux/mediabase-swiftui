//
//  Font.swift
//  mediabase
//
//  Created by Leandro on 05/09/2024.
//

import SwiftUI

extension Font {
    
    enum FontSize: CGFloat {
        case title = 22
        case normal = 19
    }
    
    static func primary(_ size: FontSize) -> Font {
        return .custom("NIKEARegular", size: size.rawValue)
    }

    static func secondary(_ size: FontSize) -> Font {
        return .custom("Futura-Medium", size: size.rawValue)
    }

}
