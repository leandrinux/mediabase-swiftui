//
//  TagListItem.swift
//  mediabase
//
//  Created by Leandro on 12/09/2024.
//

import SwiftUI

struct TagListItem: View {
    
    var tag: Tag
    var body: some View {
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
    }
}

#Preview {
    let tag = Tag(id: 0, name: "February", count: 25)
    return TagListItem(tag: tag)
}
