//
//  Storage.swift
//  mediabase
//
//  Created by Leandro on 10/09/2024.
//

import Foundation

class Storage: DataStorage {

    static let shared = Storage()

    func getMedia() async -> [Media] {
        return await Networking.shared.getAllMedia() ?? [Media]()
    }
    
    func getTags() async -> [Tag] {
        return await Networking.shared.getAllTags() ?? [Tag]()
    }
    
}
