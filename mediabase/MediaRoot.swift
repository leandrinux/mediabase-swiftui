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
    
    init(media: [Media]? = nil, tags: [Tag]? = nil) {
        self.media = media
        self.tags = tags
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Color.app(.main)),
            .font: UIFont.secondary(.normal)
        ]
        
    }
    
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
