//
//  ProfileDTO.swift
//  ClientAPI
//
//  Created by Tark Wight on 23.07.2024.
//

public struct ProfileDTO: Codable {
    
    public let userId: UUID
    public let name: String
    public let aboutMyself: String?
    public let avatar: String?
    public let topics: [TopicDTO]?
    
    public init(userId: UUID, name: String, aboutMyself: String? = nil, avatar: String? = nil, topics: [TopicDTO]? = nil) {
        self.userId = userId
        self.name = name
        self.aboutMyself = aboutMyself
        self.avatar = avatar
        self.topics = topics
    }
    
    
}
