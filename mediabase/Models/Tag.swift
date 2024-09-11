//
//  Tag.swift
//  mediabase
//
//  Created by Leandro on 30/08/2024.
//

import Foundation

struct Tag: Hashable, Codable, Identifiable {
    let id: Int
    let name: String
    let count: Int
}
