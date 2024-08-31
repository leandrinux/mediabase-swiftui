//
//  TestStorage.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import Foundation

class TestStorage {
    
    static let mediaList = [
        Media(id: UUID().uuidString),
        Media(id: UUID().uuidString, type: "video"),
        Media(id: UUID().uuidString, type: "video"),
        Media(id: UUID().uuidString, type: "video"),
        Media(id: UUID().uuidString),
        Media(id: UUID().uuidString),
        Media(id: UUID().uuidString),
        Media(id: UUID().uuidString),
    ]

    static let tagList = [
        Tag(id: UUID().uuidString, name: "2020"),
        Tag(id: UUID().uuidString, name: "2021"),
        Tag(id: UUID().uuidString, name: "2022"),
        Tag(id: UUID().uuidString, name: "2023"),
        Tag(id: UUID().uuidString, name: "2024"),
        Tag(id: UUID().uuidString, name: "August"),
        Tag(id: UUID().uuidString, name: "September"),
        Tag(id: UUID().uuidString, name: "Person"),
        Tag(id: UUID().uuidString, name: "Cat"),
        Tag(id: UUID().uuidString, name: "Birthday"),
    ]
}
