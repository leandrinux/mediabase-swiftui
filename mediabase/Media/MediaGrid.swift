//
//  MediaGrid.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI

struct MediaGrid: View {
    
    var dataStorage: DataStorage
    var media: [Media]?
        
    private let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 2)
    ]
    
    var body: some View {
        ZStack {
            if let media = media {
                if media.count == 0 {
                    EmptyMediaGrid()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 2) {
                            ForEach(media) { media in
                                MediaGridCell(dataStorage: dataStorage, media: media)
                            }
                        }
                    }
                    .background(Color.app(.viewBackground))                    
                }
            } else {
                Color.app(.viewBackground)
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
                MediaGrid(dataStorage: MockStorage(), media: media)
                    .task {
                        media = await MockStorage.shared.getMedia()
                    }
            }
        }
    return AsyncTestView()
}

#Preview("Empty") {
    MediaGrid(
        dataStorage: MockStorage()
    )
}
