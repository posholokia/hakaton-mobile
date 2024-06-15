//
//  AuthAndRegistrationResponseModels.swift
//  W2WMatch
//
//  Created by Floron on 15.06.2024.
//

import Foundation

struct ResponseAuthTokens: Codable {
    //let id: Int64
    let accessToken: String
    //let accessTokenExpire: Int64
    let refreshToken: String
    //let refreshTokenExpire: Int64
    
    enum CodingKeys: String, CodingKey {
        //case id
        case accessToken = "access"
        //case accessTokenExpire = "access_token_expire"
        case refreshToken = "refresh"
        //case refreshTokenExpire = "refresh_token_expire"
    }
    
    func getTokensInfo() -> TokensInfo {
        guard let accessTokenExpire = try? TokenDecoder.shared.decode(jwtToken: accessToken) else { return TokensInfo(accessToken: "", accessTokenExpire: 0, refreshToken: "", refreshTokenExpire: 0) }
        
        guard let refreshTokenExpire = try? TokenDecoder.shared.decode(jwtToken: refreshToken) else { return TokensInfo(accessToken: "", accessTokenExpire: 0, refreshToken: "", refreshTokenExpire: 0) }
        
        return TokensInfo(accessToken: accessToken,
                          accessTokenExpire: accessTokenExpire * 1000,
                          refreshToken: refreshToken,
                          refreshTokenExpire: refreshTokenExpire * 1000)
    }
}


struct ResponseRegister: Codable {
    let id: Int64
    let email: String
    //let accessTokenExpire: Int64
    let phone: String
    //let refreshTokenExpire: Int64
    
    enum CodingKeys: String, CodingKey {
        case id
        case email = "email"
        //case accessTokenExpire = "access_token_expire"
        case phone = "phone"
        //case refreshTokenExpire = "refresh_token_expire"
    }
}
