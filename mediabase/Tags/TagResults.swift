//
//  TagResults.swift
//  mediabase
//
//  Created by Leandro on 12/09/2024.
//

import SwiftUI

struct TagResults: View {
    
    var tag: Tag
    @State var media: [Media]?
    
    var body: some View {
        MediaGrid(media: media)
            .task {
                self.media = await Networking().getMedia(tag: tag)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(tag.name)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton()
                }
            }
    }
}

#Preview {
    let tag = Tag(id: 0, name: "February", count: 255)
    return TagResults(tag: tag)
}
