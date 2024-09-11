//
//  MediaRoot.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct MediaRoot: View {
    var media: [Media]?
    var tags: [Tag]?
    
    var body: some View {
        TabView {
            MediaNavigation()
                .tabItem {
                    Label("Media", systemImage: "star")
                }
            TagNavigation()
                .tabItem {
                    Label("Tags", systemImage: "star")
                }
        }
    }
}
