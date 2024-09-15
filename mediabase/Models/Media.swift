//
//  Media.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import UIKit

struct Media: Hashable, Codable, Identifiable {
    let id: String
    var type: String?
    var tags: [String]?
        
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "media_type"
        case tags = "tags"
    }
}
