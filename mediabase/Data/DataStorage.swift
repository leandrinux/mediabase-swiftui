//
//  DataStorage.swift
//  mediabase
//
//  Created by Leandro on 10/09/2024.
//

import Foundation

protocol DataStorage {
    
    func getMediaFileUrl(media: Media) -> URL?

    func getMediaPreviewUrl(id: String) -> URL?
    
    func getMedia() async -> [Media]
    
    func getMedia(tag: Tag) async -> [Media]

    func getMediaWithQRs() async -> [QRMedia]
    
    func getTags() async -> [Tag]
    
}
