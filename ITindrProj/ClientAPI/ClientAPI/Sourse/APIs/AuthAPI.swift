//
//  AuthAPI.swift
//  ITindr
//
//  Created by Tark Wight on 23.07.2024.
//

import Alamofire

open class AuthAPI {
    
    // MARK: - Login
    
    /**
     Logs in a user with the provided credentials.
     
     - Parameters:
       - body: The login credentials.
       - completion: The closure to call with the result.
     */
    open class func login(
        body: AuthBody,
        completion: @escaping (_ data: TokenDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Auth.login
        
        AF.request(
            url,
            method: .post,
            parameters: body,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: TokenDTO.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    // MARK: - Register
    
    /**
     Registers a new user with the provided details.
     
     - Parameters:
       - body: The registration details.
       - completion: The closure to call with the result.
     */
    open class func register(
        body: AuthBody,
        completion: @escaping (_ data: TokenDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Auth.register
        
        AF.request(
            url,
            method: .post,
            parameters: body,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: TokenDTO.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    // MARK: - Refresh
    
    /**
     Refreshes the authentication token.
     
     - Parameters:
       - authDTO: The current authentication data.
       - completion: The closure to call with the result.
     */
    open class func refresh(
        token: TokenDTO,
        completion: @escaping (_ data: TokenDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Auth.refresh
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token.accessToken)"
        ]
        
        AF.request(
            url,
            method: .post,
            parameters: token.refreshToken,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate()
        .responseDecodable(of: TokenDTO.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    // MARK: - Logout
    
    /**
     Logs out the current user.
     
     - Parameters:
       - authDTO: The current authentication data.
       - completion: The closure to call with the result.
     */
    open class func logout(
        token: TokenDTO,
        completion: @escaping (_ data: Void?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Auth.logout
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token.accessToken)"
        ]
        
        AF.request(
            url,
            method: .delete,
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
    
    
}
