//
//  ChatWithLastMessageDTO.swift
//  ClientAPI
//
//  Created by Tark Wight on 23.07.2024.
//

public struct ChatWithLastMessageDTO: Codable {
    
    let chat: ChatDTO
    let lastMessage: MessageDTO
    
}
