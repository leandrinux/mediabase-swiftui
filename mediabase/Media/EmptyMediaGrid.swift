//
//  EmptyMediaGrid.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct EmptyMediaGrid: View {
    var body: some View {
        VStack {
            Image("gallery")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(Color("MBGray"))
                .frame(width: 100, height: 100)
                .padding()
            Text("Once you upload your photos and videos they will appear here")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("MBGray"))
        }.padding()
    }
}

#Preview {
    EmptyMediaGrid()
}
