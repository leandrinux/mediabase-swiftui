//
//  MediaNavigation.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI

struct MediaNavigation: View {
    
    var media = [Media]()

    var body: some View {
        NavigationStack {
            MediaGrid(media: media)
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mediabase")
                            .font(.primary(.title))
                            .foregroundStyle(Color.app(.main))
                    }
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Image("add")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 38)
                                .foregroundStyle(Color.app(.main))
                        }
                    }
                }
        }
    }
    
}

#Preview("With photos") {
    struct AsyncTestView: View {
        @State var media = [Media]()
            var body: some View {
                MediaNavigation(media: media)
                    .task {
                        media = await MockStorage.shared.getMedia()
                    }
            }
        }
    return AsyncTestView()
}

#Preview("No photos") {
    MediaNavigation()
}
