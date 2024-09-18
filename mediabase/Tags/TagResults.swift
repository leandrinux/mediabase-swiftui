//
//  TagResults.swift
//  mediabase
//
//  Created by Leandro on 12/09/2024.
//

import SwiftUI

struct TagResults: View {
    
    var dataStorage: DataStorage
    
    var tag: Tag
    @State var media: [Media]?
    
    var body: some View {
        MediaGrid(dataStorage: dataStorage, media: media)
            .task {
                self.media = await dataStorage.getMedia(tag: tag)
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
    TagResults(
        dataStorage: MockStorage(),
        tag: Tag(id: 0, name: "February", count: 255)
    )
}
