//
//  MessageDTO.swift
//  ClientAPI
//
//  Created by Tark Wight on 23.07.2024.
//

public struct MessageDTO: Codable {
    
    public let id: UUID
    public let text: String
    public let createdAt: Date
    public let user: ProfileDTO
    public let attachments: [Data]
    
    public init(id: UUID, text: String, createdAt: Date, user: ProfileDTO, attachments: [Data] = []) {
        self.id = id
        self.text = text
        self.createdAt = createdAt
        self.user = user
        self.attachments = attachments
    }
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case text
        case createdAt
        case user
        case attachments
    }
    
    
}
