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
    var latitude: Double?
    var longitude: Double?
    var tags: [String]?
    
    var previewUrl: URL? {
        debugPrint("preview url for id \(id)")
        return URL(string: "\(Networking.baseURL)/media/\(id)/preview")
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "media_type"
        case latitude = "latitude"
        case longitude = "longitude"
        case tags = "tags"
    }
}
