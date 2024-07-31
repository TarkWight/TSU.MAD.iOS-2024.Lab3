//
//  ProfileAPI.swift
//  ITindr
//
//  Created by Tark Wight on 23.07.2024.
//

import Alamofire

open class UserAPI {
    /**
     Getting a list of users who may be of interest to you
     
     - Parameters:
        - token: The authentication token
        - completion: completion handler to receive the data and the error objects
     */
    open class func getUserFeed(
        token: TokenDTO,
        completion: @escaping (_ data: [ProfileDTO]?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.User.feed
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token.accessToken)"
        ]

        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseDecodable(of: [ProfileDTO].self) { response in
            switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }

    /**
     Getting a list of all users
     
     - Parameters:
        - token: The authentication token
        - limit: (query) Quantity per request
        - offset: (query) Offset for the selection
        - completion: completion handler to receive the data and the error objects
     */
    open class func getUsers(
        token: TokenDTO,
        limit: Int,
        offset: Int,
        completion: @escaping (_ data: [ProfileDTO]?, _ error: Error?) -> Void
    ) {
        var urlComponents = URLComponents(string: APIConstants.User.get)
        urlComponents?.queryItems = [
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ]

        guard let urlString = urlComponents?.url?.absoluteString else {
            completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token.accessToken)"
        ]

        AF.request(
            urlString,
            method: .get,
            headers: headers
        )
        .validate()
        .responseDecodable(of: [ProfileDTO].self) { response in
            switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }

    /**
     Disliking a user
     
     - Parameters:
        - token: The authentication token
        - userId: (path) ID of user
        - completion: completion handler to receive the data and the error objects
     */
    open class func dislikeUser(
        token: TokenDTO,
        userId: UUID,
        completion: @escaping (_ data: Void?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.User.dislike(userId: userId)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token.accessToken)"
        ]

        AF.request(
            url,
            method: .post,
            headers: headers
        )
        .validate()
        .response { response in
            switch response.result {
                case .success:
                    completion((), nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }

    /**
     Liking a user

     - Parameters:
        - token: The authentication token
        - userId: (path) ID of user
        - completion: completion handler to receive the data and the error objects
     */
    open class func likeUser(
        token: TokenDTO,
        userId: UUID,
        completion: @escaping (_ data: MutualLikeDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.User.like(userId: userId)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token.accessToken)"
        ]

        AF.request(
            url,
            method: .post,
            headers: headers
        )
        .validate()
        .responseDecodable(of: MutualLikeDTO.self) { response in
            switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
    
    
}
