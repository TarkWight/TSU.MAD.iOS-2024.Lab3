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
    
    // Topic Endpoints
    static let topic = "\(basePath)/topic"
   
    // Profile Endpoints
    public struct Profile {
        static let avatarDelete = "\(basePath)/profile/avatar"
        static let avatarPost = "\(basePath)/profile/avatar"
        static let get = "\(basePath)/profile"
        static let patch = "\(basePath)/profile"
    }
    
    
    // User Endpoints
    public struct User {
        static let feed = "\(basePath)/user/feed"
        static let get = "\(basePath)/user"
        static func dislike(userId: UUID) -> String {
            return "\(basePath)/user/\(userId.uuidString)/dislike"
        }
        static func like(userId: UUID) -> String {
            return "\(basePath)/user/\(userId.uuidString)/like"
        }
    }
    
    // Chat Endpoints
    public struct Chat {
        static func messages(chatId: UUID) -> String {
            return "\(basePath)/chat/\(chatId.uuidString)/message"
        }
        static let create = "\(basePath)/chat"
        static let list = "\(basePath)/chat"
    }
    
    
}
