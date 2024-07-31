//
//  ChatAPI.swift
//  ITindr
//
//  Created by Tark Wight on 23.07.2024.
//

import Alamofire

open class ChatAPI {
    // MARK: - Getting a list of messages for chat
    /**
     Getting a list of messages for chat

     - Parameters:
        - token: The token containing the access token.
        - chatId: ID of the chat.
        - limit: Quantity per request.
        - offset: Offset for the selection.
        - completion: Completion handler to receive the data and the error objects.
     */

    open class func getMessages(
        token: String,
        chatId: UUID,
        limit: Int,
        offset: Int,
        completion: @escaping (_ data: [MessageDTO]?, _ error: Error?) -> Void
    ) {
        var urlComponents = URLComponents(string: APIConstants.Chat.messages(chatId: chatId))
        urlComponents?.queryItems = [
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ]

        guard let url = urlComponents?.url?.absoluteString else {
            completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]

        AF.request(
            url,
            method: .get,
            headers: headers
        )
            .validate()
            .responseDecodable(of: [MessageDTO].self) { response in
                switch response.result {
                    case .success(let data):
                        completion(data, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }

    // MARK: - Send message to chat
    /**
     Getting a list of messages for chat

     - Parameters:
        - token: The token containing the access token.
        - chatId: ID of the chat.
        - limit: Quantity per request.
        - offset: Offset for the selection.
        - completion: Completion handler to receive the data and the error objects.
     */

    open class func sendMessage(
        token: String,
        messageText: String,
        attachments: [Data] = [],
        chatId: UUID,
        completion: @escaping (_ data: MessageDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Chat.messages(chatId: chatId)
        
        let multipartFormData: MultipartFormData = MultipartFormData()
        multipartFormData.append(Data(messageText.utf8), withName: "messageText")
        
        for (index, attachment) in attachments.enumerated() {
            multipartFormData.append(attachment, withName: "attachments[\(index)]", fileName: "attachment\(index).dat", mimeType: "application/octet-stream")
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]

        AF.upload(
            multipartFormData: multipartFormData,
            to: url,
            method: .post,
            headers: headers
        )
            .validate()
            .responseDecodable(of: MessageDTO.self) { response in
                switch response.result {
                    case .success(let data):
                        completion(data, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }

    // MARK: - Getting a list of chats for current user
    /**
     Getting a list of chats for current user
     
     - Parameters:
        - token: The token containing the access token.
        - completion: Completion handler to receive the data and the error objects.
     */

    open class func getChats(
        token: String,
        completion: @escaping (_ data: [ChatWithLastMessageDTO]?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Chat.list
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]

        AF.request(
            url,
            method: .get,
            headers: headers
        )
            .validate()
            .responseDecodable(of: [ChatWithLastMessageDTO].self) { response in
                switch response.result {
                    case .success(let data):
                        completion(data, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }

    // MARK: - Create new chat
    /**
     Create new chat

     - Parameters:
        - token: The token containing the access token.
        - body: The body of the request containing chat creation details.
        - completion: Completion handler to receive the data and the error objects.
     */

    open class func createChat(
        token: String,
        userId: UUID,
        completion: @escaping (_ data: ChatDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Chat.create
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]

        AF.request(
            url,
            method: .post,
            parameters: userId,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
            .validate()
            .responseDecodable(of: ChatDTO.self) { response in
                switch response.result {
                    case .success(let data):
                        completion(data, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
    
    
}
