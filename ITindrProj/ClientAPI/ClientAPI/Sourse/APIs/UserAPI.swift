//
//  ProfileAPI.swift
//  ITindr
//
//  Created by Tark Wight on 23.07.2024.
//

import Alamofire

open class UserAPI {
    //MARK: - Get user feed
    /**
     Getting a list of users who may be of interest to you
     
     - Parameters:
        - token: The token containing the access token.
        - completion: completion handler to receive the data and the error objects.
     */
    open class func getUserFeed(
        token: String,
        completion: @escaping (_ data: [ProfileDTO]?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.User.feed
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
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

    //MARK: - Get a list of all users
    /**
     Getting a list of all users
     
     - Parameters:
        - token: The token containing the access token.
        - limit: (query) Quantity per request.
        - offset: (query) Offset for the selection.
        - completion: completion handler to receive the data and the error objects.
     */
    open class func getUsers(
        token: String,
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
            "Authorization": "Bearer \(token)"
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

    //MARK: - Disliking a user
    /**
     Disliking a user
     
     - Parameters:
        - token: The token containing the access token.
        - userId: (path) ID of user.
        - completion: completion handler to receive the data and the error objects.
     */
    open class func dislikeUser(
        token: String,
        userId: UUID,
        completion: @escaping (_ data: Void?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.User.dislike(userId: userId)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
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

    //MARK: - Liking a user
    /**
     Liking a user

     - Parameters:
        - token: The token containing the access token.
        - userId: (path) ID of user.
        - completion: completion handler to receive the data and the error objects.
     */
    open class func likeUser(
        token: String,
        userId: UUID,
        completion: @escaping (_ data: MutualLikeDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.User.like(userId: userId)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
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
