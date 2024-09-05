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
    
    var body: some View {
        if let media = media {
            ZStack(alignment: .top) {
                QGrid(
                    media,
                    columns: 3,
                    vSpacing: 1,
                    hSpacing: 1,
                    vPadding: 1,
                    hPadding: 1
                ) {
                    MediaGridCell(media: $0)
                }
                .background(Color.black)
                VStack {
                    Rectangle()
                        .fill(LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom))
                        .frame(height: 100)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
                        .frame(height: 100)
                }
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)

            }
        } else {
            EmptyMediaGrid()
        }
    }
}

#Preview("Empty") {
    MediaGrid()
}

#Preview("With photos") {
    return MediaGrid(media: TestStorage.mediaList)
}
