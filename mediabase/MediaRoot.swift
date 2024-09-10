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
            MediaNavigation(media: media ?? [Media]() )
                .tabItem {
                    Label("Media", systemImage: "star")
                }
            TagNavigation(tags: tags ?? [Tag]() )
                .tabItem {
                    Label("Tags", systemImage: "star")
                }
        }
    }
}

/*
#Preview {
    MediaRoot(
        media: MockStorage.shared.getMedia(),
        tags: MockStorage.shared.getTags()
    )
}

#Preview {
    MediaRoot()
}
*/
