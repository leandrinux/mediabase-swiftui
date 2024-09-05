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
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mediabase")
                            .font(.primary(size: .title))
                            .foregroundStyle(Color.gray)
                    }
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("Add")
                                .font(.secondary(size: .normal))
                                .foregroundStyle(Color.gray)
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

