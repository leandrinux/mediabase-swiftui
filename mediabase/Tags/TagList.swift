//
//  TagList.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct TagList: View {
    
    var tags: [Tag]?
    
    var body: some View {
        
        if let tags = self.tags {
            List {
                ForEach(tags) { tag in
                    HStack {
                        Text(tag.name)
                            .foregroundStyle(Color.app(.listItemForeground))
                            .font(.secondary(.normal))
                            .padding(.leading, 3.0)
                        Spacer()
                        Text("\(tag.count)")
                            .foregroundStyle(Color.app(.listItemForeground))
                            .font(.secondary(.normal))
                    }
                    .frame(height: 40.0)
                    .listRowSeparatorTint(Color.app(.listItemForeground))
                    .listRowBackground(Color.app(.listItemBackground))
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.app(.listBackground))
        } else {
            EmptyTagsList()
        }
        
    }
    
}

#Preview("With Tags") {
    struct AsyncTestView: View {
        @State var passedValue = [Tag]()
        var body: some View {
            TagList(tags: passedValue)
                .task {
                    passedValue = await MockStorage.shared.getTags()
                }
        }
    }
    return AsyncTestView()
}

#Preview("Empty") {
    TagList()
}
