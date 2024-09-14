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
    
    private let columns = [
        GridItem(.adaptive(minimum: 180)),
        GridItem(.adaptive(minimum: 180)),
        GridItem(.adaptive(minimum: 180))
    ]
    
    var body: some View {
        ZStack {
            if let media = media {
                if media.count == 0 {
                    EmptyMediaGrid()
                } else {
                    GeometryReader { geometry in
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                let side = (geometry.size.width) / 3
                                ForEach(media) { media in
                                    MediaGridCell(media: media)
                                        .frame(width: side, height: side)
                                }
                            }.lineSpacing(0)
                        }
                    }
                    .background(Color.app(.viewBackground))
                }
            } else {
                Rectangle()
                    .fill(Color.app(.viewBackground))
                    .ignoresSafeArea(.all)
            }
            Gradients()
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
