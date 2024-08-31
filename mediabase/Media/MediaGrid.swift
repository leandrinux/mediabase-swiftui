//
//  MediaGrid.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI
import QGrid

struct MediaGrid: View {
    
    var media: [Media]?
    
    var body: some View {
        if let media = media {
            QGrid(
                media,
                columns: 3,
                vSpacing: 1,
                hSpacing: 1,
                vPadding: 1,
                hPadding: 1
            ) {
                MediaGridCell(media: $0)
            }
        } else {
            EmptyMediaGrid()
        }
    }
}

#Preview("Empty") {
    MediaGrid()
}

#Preview("With photos") {
    return MediaGrid(media: TestStorage.mediaList)
}
