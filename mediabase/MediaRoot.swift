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
            MediaNavigation(media: media)
                .tabItem {
                    Label("Media", systemImage: "star")
                }
            TagList(tags: tags)
                .tabItem {
                    Label("Tags", systemImage: "star")
                }
        }
    }
}

#Preview {
    MediaRoot(media: TestStorage.mediaList, tags: TestStorage.tagList)
}

#Preview {
    MediaRoot()
}
