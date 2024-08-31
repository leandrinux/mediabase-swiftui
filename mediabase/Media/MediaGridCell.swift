//
//  MediaGridCell.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct MediaGridCell: View {
    
    var media: Media
    
    var body: some View {
        NavigationLink {
            MediaDetail(media: media)
        } label: {
            ZStack(alignment: .bottomTrailing) {
                Image("Cat1")
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .scaledToFit()
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

#Preview("Image cell") {
    let media2 = Media(id: UUID().uuidString, type: "image")
    return MediaGridCell(media: media2)
}

#Preview("Video cell") {
    let media1 = Media(id: UUID().uuidString, type: "video")
    return MediaGridCell(media: media1)
}
