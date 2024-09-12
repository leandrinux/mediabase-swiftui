//
//  TagResults.swift
//  mediabase
//
//  Created by Leandro on 12/09/2024.
//

import SwiftUI

struct TagResults: View {
    
    var tag: Tag
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let tag = Tag(id: 0, name: "February", count: 255)
    return TagResults(tag: tag)
}
