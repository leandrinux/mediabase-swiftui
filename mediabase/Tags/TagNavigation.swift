//
//  TagNavigation.swift
//  mediabase
//
//  Created by Leandro on 31/08/2024.
//

import SwiftUI

struct TagNavigation: View {
    
    var tags: [Tag]?

    var body: some View {
        NavigationStack {
            TagList(tags: tags)
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
                            Image("search")
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

#Preview {
    struct AsyncTestView: View {
        @State var tags = [Tag]()
        var body: some View {
            TagNavigation(tags: tags)
                .task {
                    tags = await MockStorage.shared.getTags()
                }
        }
    }
    return AsyncTestView()
}

