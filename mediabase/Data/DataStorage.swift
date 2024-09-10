//
//  DataStorage.swift
//  mediabase
//
//  Created by Leandro on 10/09/2024.
//

import Foundation

protocol DataStorage {
    
    func getMedia() async -> [Media]
    
    func getTags() async -> [Tag]
    
}
