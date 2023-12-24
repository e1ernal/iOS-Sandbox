//
//  NetworkService.swift
//  Networking [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import Foundation

// MARK: - Network service with Asynk / Await
class NetworkService {
    static let shared = NetworkService(); private init() { }
    
    private func createURL() -> URL? {
        let tunnel = "https://"
        let server = "randomuser.me"
        let endpoint = "/api"
        let getParams = ""
        let urlStr = tunnel + server + endpoint + getParams
        
        let url = URL(string: urlStr)
        return url
    }
    
    func fetchData() async throws -> UserResults {
        guard let url = createURL() else { throw NetworkError.errorURL }
        
        let response = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(UserResults.self, from: response.0)
        
        return result
    }
}

// MARK: - Networking Errors
enum NetworkError: Error {
    case errorURL, errorRequest, errorResponse, invalidData
}
