//
//  MediaRoot.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import SwiftUI

struct MediaRoot: View {
    var dataStorage: DataStorage
    var media: [Media]?
    var tags: [Tag]?
    
    func setAppearances() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Color.app(.main)),
            .font: UIFont.secondary(.normal)
        ]
        
        let barColor = UIColor.black
        UITabBar.appearance().barTintColor = barColor
        UINavigationBar.appearance().barTintColor = barColor
    }
     
    init(dataStorage: DataStorage, media: [Media]? = nil, tags: [Tag]? = nil) {
        self.dataStorage = dataStorage
        self.media = media
        self.tags = tags
        setAppearances()
    }
    
    var body: some View {
        TabView {
            MediaNavigation(dataStorage: dataStorage)
                .tabItem {
                    Label("Media", systemImage: "star")
                }
            TagNavigation(dataStorage: dataStorage)
                .tabItem {
                    Label("Tags", systemImage: "star")
                }
            QRList(dataStorage: dataStorage)
                .tabItem {
                    Label("QRs", systemImage: "star")
                }
        }
    }
}
