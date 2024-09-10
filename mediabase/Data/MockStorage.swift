//
//  MockStorage.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import Foundation

class MockStorage: DataStorage {
    
    static let shared = MockStorage()
    
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
    
    func getTags() async -> [Tag] {
        return [
            Tag(id: UUID().uuidString, name: "2020", count: 10),
            Tag(id: UUID().uuidString, name: "2021", count: 15),
            Tag(id: UUID().uuidString, name: "2022", count: 12),
            Tag(id: UUID().uuidString, name: "2023", count: 11),
            Tag(id: UUID().uuidString, name: "2024", count: 7),
            Tag(id: UUID().uuidString, name: "August", count: 2),
            Tag(id: UUID().uuidString, name: "September", count: 3),
            Tag(id: UUID().uuidString, name: "Person", count: 1),
            Tag(id: UUID().uuidString, name: "Cat", count: 20),
            Tag(id: UUID().uuidString, name: "Birthday", count: 5),
        ]
    }
    
}
