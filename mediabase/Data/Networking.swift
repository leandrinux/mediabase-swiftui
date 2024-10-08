//
//  Networking.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import Foundation

struct EmptyRequest: Codable { }

struct SimpleRequest: Codable {
    let id: String
}

struct StandardResponse: Codable {
    let id: String
    let message: String
}

fileprivate enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkingError: Error {
    case invalidURL
    case jsonEncoding
    case invalidResponse
    case serverError
    case other
}

class Networking: NSObject {
    
    static let baseURL = "http://leandrim1.local:3000"

    fileprivate func sendJsonRequest<T:Codable, U:Codable>(method: HTTPMethod, endpoint: String, arguments: T) async throws -> U? {
        
        guard let url = URL(string: endpoint) else {
            throw NetworkingError.invalidURL
        }
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if method != .get {
            do {
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let body = try encoder.encode(arguments)
                request.httpBody = body
            } catch {
                throw NetworkingError.jsonEncoding
            }
        }
        
        do {
            let (data, response) = try await urlSession.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkingError.invalidResponse
            }
            let decodedResponse = try JSONDecoder().decode(U.self, from: data)
            if httpResponse.statusCode < 400 {
                return decodedResponse
            } else {
                throw NetworkingError.serverError
            }
        } catch {
            throw NetworkingError.other
        }
    }
    
}

extension Networking : URLSessionDelegate {
    
}

extension Networking: DataStorage {
    
    func getMediaFileUrl(media: Media) -> URL? {
        let url = URL(string: "\(Networking.baseURL)/media/\(media.id)/file")
        return url
    }

    func getMediaPreviewUrl(id: String) -> URL? {
        let url = URL(string: "\(Networking.baseURL)/media/\(id)/preview")
        return url
    }

    func getMedia() async -> [Media] {
        debugPrint("Get all media")
        let endpoint = "\(Networking.baseURL)/media"
        let media: [Media]? = try? await sendJsonRequest(method: .get, endpoint: endpoint, arguments: EmptyRequest())
        return media ?? [Media]()
    }

    func getMediaWithQRs() async -> [QRMedia] {
        debugPrint("Get all media with QR codes")
        let endpoint = "\(Networking.baseURL)/qr/media"
        let media: [QRMedia]? = try? await sendJsonRequest(method: .get, endpoint: endpoint, arguments: EmptyRequest())
        return media ?? [QRMedia]()
    }

    func getMedia(tag: Tag) async -> [Media] {
        debugPrint("Get media for tag \(tag.name)")
        let endpoint = "\(Networking.baseURL)/media?tags=\(tag.name)"
        let media: [Media]? = try? await sendJsonRequest(method: .get, endpoint: endpoint, arguments: EmptyRequest())
        return media ?? [Media]()
    }

    func getTags() async -> [Tag] {
        debugPrint("Get all tags")
        let endpoint = "\(Networking.baseURL)/tags"
        let media: [Tag]? = try? await sendJsonRequest(method: .get, endpoint: endpoint, arguments: EmptyRequest())
        return media ?? [Tag]()
    }
    
}
