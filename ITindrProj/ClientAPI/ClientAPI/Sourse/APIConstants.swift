//
//  APIConstants.swift
//  ClientAPI
//
//  Created by Tark Wight on 23.07.2024.
//


public struct APIConstants {
    private static let basePath = "http://itindr.mcenter.pro:8092/api/mobile/v1"
    
    // Auth Endpoints
    public struct Auth {
        static let login = "\(basePath)/auth/login"
        static let register = "\(basePath)/auth/register"
        static let refresh = "\(basePath)/auth/refresh"
        static let logout = "\(basePath)/auth/logout"
    }
    
   
}
