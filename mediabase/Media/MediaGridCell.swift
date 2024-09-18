//
//  MediaGridCell.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct MediaGridCell: View {
    
    var dataStorage: DataStorage
    
    var media: Media
    
    var body: some View {
        NavigationLink {
            MediaDetail(dataStorage: dataStorage, media: media)
        } label: {
            AsyncImage(url: dataStorage.getMediaPreviewUrl(id: media.id)) { phase in
                if let image = phase.image {
                    ZStack(alignment: .bottomTrailing) {
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .scaledToFit()
                            .clipped()
                        if media.type == "video" {
                            Image("play")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(.white)
                                .frame(width: 35, height: 35)
                                .aspectRatio(1, contentMode: .fill)
                                .padding(5)
                        }
                    }
                }
            }
        }
    }
}

#Preview("Image cell") {
    MediaGridCell(
        dataStorage: MockStorage(),
        media: Media(id: UUID().uuidString, type: "image")
    )
}

#Preview("Video cell") {
    MediaGridCell(
        dataStorage: MockStorage(),
        media: Media(id: UUID().uuidString, type: "video")
    )
}
