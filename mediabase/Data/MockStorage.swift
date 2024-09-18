//
//  MockStorage.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import Foundation

class MockStorage: DataStorage {
    
    static let shared = MockStorage()
    
    func getMediaFileUrl(media: Media) -> URL? {
        return Bundle.main.url(forResource: "Cat", withExtension: "jpg")
    }
    
    func getMediaPreviewUrl(id: String) -> URL? {
        return Bundle.main.url(forResource: "Cat", withExtension: "jpg")
    }
    
    func getMedia() async -> [Media] {
        return [
            Media(id: UUID().uuidString),
            Media(id: UUID().uuidString, type: "video"),
            Media(id: UUID().uuidString, type: "video"),
            Media(id: UUID().uuidString, type: "video"),
            Media(id: UUID().uuidString),
            Media(id: UUID().uuidString),
            Media(id: UUID().uuidString),
            Media(id: UUID().uuidString),
        ]
    }
    
    func getMedia(tag: Tag) async -> [Media] {
        return [
            Media(id: UUID().uuidString)
        ]
    }
    
    func getMediaWithQRs() async -> [QRMedia] {
        return []
    }
    
    func getTags() async -> [Tag] {
        return [
            Tag(id: 0, name: "2020", count: 10),
            Tag(id: 1, name: "2021", count: 15),
            Tag(id: 2, name: "2022", count: 12),
            Tag(id: 3, name: "2023", count: 11),
            Tag(id: 4, name: "2024", count: 7),
            Tag(id: 5, name: "August", count: 2),
            Tag(id: 6, name: "September", count: 3),
            Tag(id: 7, name: "Person", count: 1),
            Tag(id: 8, name: "Cat", count: 20),
            Tag(id: 9, name: "Birthday", count: 5),
        ]
    }
    
}
