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
        case normal = 20
    }
    
    static func primary(size: FontSize) -> Font {
        return .custom("NIKEARegular", size: size.rawValue)
    }

    static func secondary(size: FontSize) -> Font {
        return .custom("CoolveticaRg-Regular", size: size.rawValue)
    }

}
