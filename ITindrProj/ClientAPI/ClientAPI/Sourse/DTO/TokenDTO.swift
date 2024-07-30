//
//  TokenDTO.swift
//
//  Created by Tark Wight on 23.07.2024.
//

public struct TokenDTO: Codable {

    public var accessToken: String
    public var accessTokenExpiredAt: Date
    public var refreshToken: String
    public var refreshTokenExpiredAt: Date

    public init(accessToken: String, accessTokenExpiredAt: Date, refreshToken: String, refreshTokenExpiredAt: Date) {
        self.accessToken = accessToken
        self.accessTokenExpiredAt = accessTokenExpiredAt
        self.refreshToken = refreshToken
        self.refreshTokenExpiredAt = refreshTokenExpiredAt
    }


}
