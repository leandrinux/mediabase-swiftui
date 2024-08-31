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
    
    static let shared = Networking()
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
    
    func getAllMedia() async -> [Media]? {
        let endpoint = "\(Networking.baseURL)/media"
        let media: [Media]? = try? await sendJsonRequest(method: .get, endpoint: endpoint, arguments: EmptyRequest())
        return media
    }
    
}

extension Networking : URLSessionDelegate {
    
}
