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
        ZStack {
            Color.green
            AsyncImage(
                url: Networking().getMediaFileUrl(media: media)
            ) { phase in
                if let image = phase.image {
                    ZoomableScrollView {
                        image
                            .scaledToFit()
                    }
                }
            }
            .background(Color.black)
            .ignoresSafeArea()
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
    }
}

#Preview {
    MediaDetail(media: Media(id: UUID().uuidString))
}
