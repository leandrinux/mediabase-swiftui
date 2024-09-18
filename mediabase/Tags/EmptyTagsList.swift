//
//  EmptyTagsList.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct EmptyTagsList: View {
    
    var body: some View {
        VStack {
            Image("tags")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(Color.app(.emptyViewText))
                .frame(width: 100, height: 100)
                .padding()
            Text("You do not currently have any tagged media")
                .font(.secondary(.normal))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.app(.emptyViewText))
        }.padding()
    }
    
}

#Preview {
    EmptyTagsList()
}
