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
                            .padding(.leading, 3.0)
                        Spacer()
                        Text("\(tag.count)")
                    }
                    .frame(height: 40.0)
                    
                }
            }
            
            
        } else {
            EmptyTagsList()
        }
        
    }
    
}

#Preview("With Tags") {
    TagList(tags: TestStorage.tagList)
}

#Preview("Empty") {
    TagList()
}
