//
//  Gradients.swift
//  mediabase
//
//  Created by Leandro on 10/09/2024.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom))
                .frame(height: 120)
            Spacer()
            Rectangle()
                .fill(LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
                .frame(height: 120)
        }
        .edgesIgnoringSafeArea(.all)
        .opacity(0.8)
    }
}

#Preview {
    Gradients()
}
