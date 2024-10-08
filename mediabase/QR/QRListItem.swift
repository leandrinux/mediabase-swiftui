//
//  QRListItem.swift
//  mediabase
//
//  Created by Leandro on 15/09/2024.
//

import SwiftUI

struct QRListItem: View {
    var dataStorage: DataStorage
    
    let qrMedia: QRMedia
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: dataStorage.getMediaPreviewUrl(id: qrMedia.id)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .scaledToFit()
                        .clipped()
                        .frame(width: 44, height: 44)
                }
            }
            Text(qrMedia.value)
        }
    }
}

#Preview {
    QRListItem(
        dataStorage: MockStorage(),
        qrMedia: QRMedia(id: "0", value: "Hello")
    )
}
