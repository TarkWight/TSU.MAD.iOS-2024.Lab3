//
//  TopicAPI.swift
//  ClientAPI
//
//  Created by Tark Wight on 23.07.2024.
//

import Alamofire

open class TopicAPI {
    
    // MARK: - Get topics
    /**
     Getting a list of all topics.

     - Parameters:
       - token: The token containing the access token.
       - completion: The closure to call with the result.
     */
    open class func topic(
        token: String,
        completion: @escaping (_ data: [TopicDTO]?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.topic
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
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
