//
//  TagNavigation.swift
//  mediabase
//
//  Created by Leandro on 31/08/2024.
//

import SwiftUI

struct TagNavigation: View {
    
    var dataStorage: DataStorage

    var body: some View {
        NavigationStack {
            TagList(dataStorage: dataStorage)
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mediabase")
                            .padding(.top, 10)
                            .font(.primary(.title))
                            .foregroundStyle(Color.app(.main))
                    }
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                        } label: {
                            Image("search")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.app(.main))
                        }
                    }
                }
        }
    }
}

#Preview {
    struct AsyncTestView: View {
        @State var tags = [Tag]()
        var body: some View {
            TagNavigation(dataStorage: MockStorage())
                .task {
                    tags = await MockStorage.shared.getTags()
                }
        }
    }
    return AsyncTestView()
}

