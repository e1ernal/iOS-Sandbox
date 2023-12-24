//
//  NetworkService-Completions.swift
//  Networking [URLSession, Completion]
//
//  Created by e1ernal on 23.12.2023.
//

import Foundation

// MARK: - Network service with Completions
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
    
    func fetchData(completion: @escaping (Result<UserResults, Error>) -> ()) {
        guard let url = createURL() else {
            completion(.failure(NetworkingError.errorURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let usersData = try decoder.decode(UserResults.self, from: data)
                completion(.success(usersData))
            } catch {
                completion(.failure(NetworkingError.invalidData))
            }
        }.resume()
        
    }
}

// MARK: - Networking Errors
enum NetworkingError: Error {
    case errorURL, errorRequest, errorResponse, invalidData
}
