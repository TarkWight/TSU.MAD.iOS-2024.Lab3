//
// UpdateProfileBody.swift
//
//  Created by Tark Wight on 23.07.2024.
//

import Foundation



public struct UpdateProfileBody: Codable {

    public var name: String
    public var aboutMyself: String?
    public var topics: [UUID]?

    public init(name: String, aboutMyself: String? = nil, topics: [UUID]? = nil) {
        self.name = name
        self.aboutMyself = aboutMyself
        self.topics = topics
    }


}
