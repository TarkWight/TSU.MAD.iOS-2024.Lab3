//
// UpdateProfileDTO.swift
//
//  Created by Tark Wight on 23.07.2024.
//

import Foundation



public struct UpdateProfileDTO: Codable {

    public let name: String
    public let aboutMyself: String?
    public let topics: [UUID]?

    public init(name: String, aboutMyself: String? = nil, topics: [UUID]? = nil) {
        self.name = name
        self.aboutMyself = aboutMyself
        self.topics = topics
    }


}
