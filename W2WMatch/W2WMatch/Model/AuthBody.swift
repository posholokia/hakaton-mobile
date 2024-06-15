//
//  AuthBody.swift
//  jwt_authorizer
//
//  Created by Lev Baklanov on 27.10.2022.
//

import Foundation

struct AuthBody: Codable {
    let email: String
    let password: String
    let phone: String
}
