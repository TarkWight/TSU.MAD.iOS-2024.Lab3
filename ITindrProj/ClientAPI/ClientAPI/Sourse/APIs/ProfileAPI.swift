//
//  ProfileAPI.swift
//  ITindr
//
//  Created by Tark Wight on 23.07.2024.
//

import Alamofire

open class ProfileAPI {

    // MARK: - Retrieving User Profile Information
    
    /**
     Retrieves the user profile information.
     
     - Parameters:
       - token: The token containing the access token.
       - completion: The closure to call with the result.
     */
    open class func getProfile(
        token: String,
        completion: @escaping (_ data: ProfileDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Profile.get
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseDecodable(of: ProfileDTO.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    // MARK: - Updating User Profile
    
    /**
     Updates the user profile with the provided details.
     
     - Parameters:
       - body: The profile details to update.
       - token: The token containing the access token.
       - completion: The closure to call with the result.
     */
    open class func updateProfile(
        body: UpdateProfileDTO,
        token: String,
        completion: @escaping (_ data: ProfileDTO?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Profile.patch
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(
            url,
            method: .patch,
            parameters: body,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate()
        .responseDecodable(of: ProfileDTO.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    // MARK: - Uploading User Avatar
    
    /**
     Uploads a new avatar for the user.
     
     - Parameters:
       - avatar: The avatar image data.
       - token: The token containing the access token.
       - completion: The closure to call with the result.
     */
    open class func uploadAvatar(
        avatar: Data,
        token: String,
        completion: @escaping (_ data: Void?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Profile.avatarPost
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(
                    avatar,
                    withName: "avatar",
                    fileName: "avatar.jpg",
                    mimeType: "image/jpeg"
                )
            },
            to: url,
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
    
    // MARK: - Delete User Avatar
    
    /**
     Deletes the user's avatar.
     
     - Parameters:
       - token: The token containing the access token.
       - completion: The closure to call with the result.
     */
    open class func deleteAvatar(
        token: String,
        completion: @escaping (_ data: Void?, _ error: Error?) -> Void
    ) {
        let url = APIConstants.Profile.avatarDelete
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
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
