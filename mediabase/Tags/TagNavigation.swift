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
                            Text("Search")
                                .font(.secondary(.normal))
                                .foregroundStyle(Color.app(.main))
                        }
                    }
                }
        }
    }
}

#Preview {
    TagNavigation(tags: TestStorage.tagList)
}
