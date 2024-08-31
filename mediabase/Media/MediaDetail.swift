//
//  MediaDetail.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI

struct MediaDetail: View {
    var media: Media
    var body: some View {
        Text("Image")
    }
}

#Preview {
    MediaDetail(media: Media(id: UUID().uuidString))
}
