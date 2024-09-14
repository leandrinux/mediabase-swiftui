//
//  MediaDetail.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI

struct MediaDetail: View {
    
    @State var media: Media
    
    var body: some View {
        AsyncImage(url: Networking().getMediaFileUrl(media: media)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .scaledToFit()
                    .clipped()
            }
        }
    }
}

#Preview {
    MediaDetail(media: Media(id: UUID().uuidString))
}
