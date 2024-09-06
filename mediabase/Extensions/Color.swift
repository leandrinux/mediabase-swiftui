//
//  Color.swift
//  mediabase
//
//  Created by Leandro on 05/09/2024.
//

import SwiftUI

extension Color {
    
    enum AppColor: String {
        case main = "Main"
        case listBackground = "ListBackground"
        case listItemBackground = "ListItemBackground"
        case listItemForeground = "ListItemForeground"
        case emptyViewText = "EmptyViewText"
    }
    
    static func app(_ color: AppColor) -> Color {
        return Color(color.rawValue)
    }
}
