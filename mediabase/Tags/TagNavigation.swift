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
                .navigationTitle("Mediabase")
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                        } label: {
                            Text("Search")
                        }
                    }
                }
        }
    }
}

#Preview {
    TagNavigation(tags: TestStorage.tagList)
}
