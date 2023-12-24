//
//  URLService.swift
//  Networking POST [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import Foundation

final class URLService {
    static let shared = URLService(); private init() { }
    
    private let tunnel = "https://"
    private let server = "jsonplaceholder.typicode.com"
    
    func createURL(endPoint: EndPoint, id: Int?) -> URL? {
        var urlStr = tunnel + server + endPoint.rawValue
        if let id { urlStr += "\(id)" }
        let url = URL(string: urlStr)
        return url
    }
}

enum EndPoint: String {
    case todos = "/todos"
    case users = "/users"
}
