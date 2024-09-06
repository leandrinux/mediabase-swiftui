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
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mediabase")
                            .font(.primary(.title))
                            .foregroundStyle(Color.app(.main))
                    }
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("Add")
                                .font(.secondary(.normal))
                                .foregroundStyle(Color.app(.main))
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

