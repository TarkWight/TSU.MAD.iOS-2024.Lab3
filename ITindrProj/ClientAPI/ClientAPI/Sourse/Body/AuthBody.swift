//
// AuthBody.swift
//
//  Created by Tark Wight on 23.07.2024.
//


public struct AuthBody: Codable {

    public var email: String
    public var password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }


}
