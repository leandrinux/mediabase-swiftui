//
//  BackButton.swift
//  mediabase
//
//  Created by Leandro on 14/09/2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Image("back")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(Color.app(.main))
                    .frame(width: 18, height: 18)
                Text("Back")
                    .font(.secondary(.normal))
                    .foregroundStyle(Color.app(.main))
            }
        }
    }
}

#Preview {
    BackButton()
}
