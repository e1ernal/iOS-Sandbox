//
//  ToDo.swift
//  Networking POST [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import Foundation

struct ToDo: Identifiable, Decodable {
    var id: Int
    let userId: Int
    let title: String
    let completed: Bool
    
    var dto: ToDoDTO {
        let dto = ToDoDTO(userId: userId, 
                          title: title,
                          completed: completed)
        return dto
    }
    
    struct ToDoDTO: Encodable {
        let userId: Int
        let title: String
        let completed: Bool
    }
}
