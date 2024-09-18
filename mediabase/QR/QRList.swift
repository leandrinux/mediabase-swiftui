//
//  QRList.swift
//  mediabase
//
//  Created by Leandro on 15/09/2024.
//

import SwiftUI

struct QRList: View {
    
    var dataStorage: DataStorage
    @State var qrMedia = [QRMedia]()
    
    var body: some View {
        List {
            ForEach(qrMedia) { qrMedia in
                QRListItem(dataStorage: dataStorage, qrMedia: qrMedia)
                .buttonStyle(PlainButtonStyle())
                .listRowSeparatorTint(Color.app(.listItemForeground))
                .listRowBackground(Color.app(.listItemBackground))
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.app(.listBackground))
        .task {
            self.qrMedia = await dataStorage.getMediaWithQRs()
        }
    }
}

#Preview {
    QRList(
        dataStorage: MockStorage()
    )
}
