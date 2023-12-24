//
//  NetworkService.swift
//  Networking POST [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService(); private init() { }
    
    func getAllToDos() async throws -> [ToDo] {
        guard let url = URLService.shared.createURL(endPoint: .todos, id: nil) else {
            throw NetworkError.errorURL
        }
        
        do {
            let response = try await URLSession.shared.data(from: url)
            let data = response.0
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let todos = try decoder.decode([ToDo].self, from: data)
            return todos
        } catch { throw error }
    }
    
    func createToDo(newToDo: ToDo.ToDoDTO) async throws -> ToDo {
        guard let url = URLService.shared.createURL(endPoint: .todos, id: nil) else {
            throw NetworkError.errorURL
        }
        
        // Создание запроса
        var request = URLRequest(url: url)
        
        // Настройки запроса
        request.httpMethod = "POST"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        let encoder = JSONEncoder()
        let body = try encoder.encode(newToDo)
        request.httpBody = body
        
        // Отправка запроса, получение ответа
        let response = try await URLSession.shared.data(for: request)
        let data = response.0
        
        // Декодирование полученных данных в Swift-модель
        let decoder = JSONDecoder()
        let todo = try decoder.decode(ToDo.self, from: data)
        return todo
    }
}
