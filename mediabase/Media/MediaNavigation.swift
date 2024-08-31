//
//  MediaNavigation.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI

struct MediaNavigation: View {
    var media: [Media]?

    var body: some View {
        NavigationStack {
            MediaGrid(media: media)
                .navigationTitle("Mediabase")
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("Add")
                        }
                    }
                }
        }
    }
    
}

#Preview("With photos") {
    MediaNavigation(media: TestStorage.mediaList)
}

#Preview("No photos") {
    MediaNavigation()
}

