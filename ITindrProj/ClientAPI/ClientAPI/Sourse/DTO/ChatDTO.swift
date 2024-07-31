//
// ChatDTO.swift
//
//  Created by Tark Wight on 23.07.2024.
//

public struct ChatDTO: Codable {
    
    public var id: UUID
    public var title: String
    public var avatar: String?
    
    public init(id: UUID, title: String, avatar: String? = nil) {
        self.id = id
        self.title = title
        self.avatar = avatar
    }
    
    public enum CodingKeys: String, CodingKey { 
        case id = "id"
        case title
        case avatar
    }
    
    
}
