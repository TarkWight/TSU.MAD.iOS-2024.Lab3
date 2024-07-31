//
// MutualLikeResponse.swift
//
//  Created by Tark Wight on 23.07.2024.
//

import Foundation

public struct MutualLikeDTO: Codable {

    public var isMutual: Bool?

    public init(isMutual: Bool? = nil) {
        self.isMutual = isMutual
    }


}
