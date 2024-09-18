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
            Color.clear.overlay(
                AsyncImage(url: dataStorage.getMediaPreviewUrl(id: media.id)) { phase in
                    switch phase {
                    case .success(let image):
                        ZStack(alignment: .bottomTrailing) {
                            image
                                .resizable()
                                .scaledToFill()
                            if media.type == "video" {
                                Image("play")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundStyle(.white)
                                    .frame(width: 35, height: 35)
                                    .padding(5)
                            }
                        }
                    default:
                        Image(systemName: "photo")
                    }
                }
            )
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .clipped()
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
