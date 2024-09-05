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
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mediabase")
                            .font(.primary(size: .title))
                            .foregroundStyle(Color.purple)
                    }
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                        } label: {
                            Text("Search")
                                .font(.secondary(size: .normal))
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
        }
    }
}

#Preview {
    TagNavigation(tags: TestStorage.tagList)
}
