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
                .foregroundStyle(Color("MBGray"))
                .frame(width: 100, height: 100)
                .padding()
            Text("You do not currently have any tagged media")
                .font(.secondary(size: .normal))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("MBGray"))
        }.padding()
    }
}

#Preview {
    EmptyTagsList()
}
