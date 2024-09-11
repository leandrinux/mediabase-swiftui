//
//  MediaNavigation.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import SwiftUI

struct MediaNavigation: View {
    
    var body: some View {
        NavigationStack {
            MediaGrid()
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mediabase")
                            .padding(.top, 10)
                            .font(.primary(.title))
                            .foregroundStyle(Color.app(.main))
                    }
                    ToolbarItem(placement:  .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Image("plus")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.app(.main))
                        }
                    }
                }
        }
    }
    
}

#Preview("No photos") {
    MediaNavigation()
}
