//
//  MediaGrid.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI
import QGrid

struct MediaGrid: View {
    
    @State var media = [Media]()
    
    var body: some View {
        ZStack {
            if media.count > 0 {
                ZStack(alignment: .top) {
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
                    .background(Color.black)
                }
            } else {
                EmptyMediaGrid()
            }
            Gradients()
        }.task {
            media = await Storage.shared.getMedia()
        }
    }
}

#Preview("With photos") {
    struct AsyncTestView: View {
        @State var media = [Media]()
            var body: some View {
                MediaGrid(media: media)
                    .task {
                        media = await MockStorage.shared.getMedia()
                    }
            }
        }
    return AsyncTestView()
}

#Preview("Empty") {
    MediaGrid()
}
