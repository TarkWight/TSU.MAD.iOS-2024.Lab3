//
// ProfileAvatarBody.swift
//
//  Created by Tark Wight on 23.07.2024.
//

import Foundation

public struct ProfileAvatarBody: Codable {

    public var avatar: Data

    public init(avatar: Data) {
        self.avatar = avatar
    }


}
