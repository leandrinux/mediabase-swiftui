//
//  QRList.swift
//  mediabase
//
//  Created by Leandro on 15/09/2024.
//

import SwiftUI

struct QRList: View {
    @State var qrMedia = [QRMedia]()
    
    var body: some View {
        List {
            ForEach(qrMedia) { qrMedia in
                QRListItem(qrMedia: qrMedia)
                .buttonStyle(PlainButtonStyle())
                .listRowSeparatorTint(Color.app(.listItemForeground))
                .listRowBackground(Color.app(.listItemBackground))
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.app(.listBackground))
        .task {
            self.qrMedia = await Networking().getMediaWithQRs()
        }
    }
}

#Preview {
    QRList()
}
