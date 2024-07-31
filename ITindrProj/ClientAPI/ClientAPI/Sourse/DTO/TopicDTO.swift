//
//  TopicDTO.swift
//  ClientAPI
//
//  Created by Tark Wight on 23.07.2024.
//

public struct TopicDTO: Codable {
    
    public let id: UUID
    public let title: String
    
    public init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }
    
    
}
