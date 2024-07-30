//
//  TopicAPI.swift
//  ClientAPI
//
//  Created by Tark Wight on 23.07.2024.
//

import Alamofire

open class TopicAPI {
    // MARK: - Getting a list of all topics
    /**
     Getting a list of all topics.
     
     - Parameters:
       - token: The current token data.
       - completion: The closure to call with the result.
     */
    open class func topic(
        token: TokenDTO,
        completion: @escaping (_ data: [TopicDTO]?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.topic
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token.accessToken)"
        ]
        
        AF.request(url,
                   method: .get,
                   headers: headers
        )
            .validate()
            .responseDecodable(of: [TopicDTO].self) { response in
                switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    
}
