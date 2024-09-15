//
//  QRMedia.swift
//  mediabase
//
//  Created by Leandro on 15/09/2024.
//

import Foundation

struct QRMedia: Hashable, Codable, Identifiable {
    let id: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case id = "mediaId"
        case value = "value"
    }
}
