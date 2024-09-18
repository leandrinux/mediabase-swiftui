//
//  TagList.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct TagList: View {
    
    var dataStorage: DataStorage
    
    @State var tags = [Tag]()
        
    var body: some View {
        ZStack {
            if tags.count > 0 {
                List {
                    ForEach(tags) { tag in
                        NavigationLink {
                            TagResults(dataStorage: dataStorage, tag: tag)
                        } label: {
                            TagListItem(tag: tag)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparatorTint(Color.app(.listItemForeground))
                        .listRowBackground(Color.app(.listItemBackground))
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.app(.listBackground))
            } else {
                EmptyTagsList()
            }
        }.task {
            self.tags = await dataStorage.getTags()
        }
    }
}

#Preview("With Tags") {
    struct AsyncTestView: View {
        @State var passedValue = [Tag]()
        var body: some View {
            TagList(
                dataStorage: MockStorage(),
                tags: passedValue
            )
            .task {
                passedValue = await MockStorage.shared.getTags()
            }
        }
    }
    return AsyncTestView()
}

#Preview("Empty") {
    TagList(dataStorage: MockStorage())
}
