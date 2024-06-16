//
//  Endpoint.swift
//  jwt_authorizer
//
//  Created by Lev Baklanov on 27.10.2022.
//

import Foundation

enum Endpoint {
    
    static let baseURL: String  = "http://localhost:8000/"

    case register
    case login
    case refreshTokens
//    case getDevelopers
    
    func path() -> String {
        switch self {
        case .register:
            return "auth/users/"
        case .login:
            return "auth/jwt/create/"
        case .refreshTokens:
            return "auth/jwt/refresh/"
//        case .getDevelopers:
//            return "api/get_devs"
        }
    }
    
    var absoluteURL: URL {
        URL(string: Endpoint.baseURL + self.path())!
    }
}
