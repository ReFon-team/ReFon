//
//  AuthTokensResponse.swift
//  CoreEntities
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation

public struct AuthTokensResponse: Decodable {
    public let accessToken: String
    public let tokenType: String
    public let expiresIn: Int
    public let expiresAt: Int
    public let refreshToken: String
    public let user: AuthUserModel
    
    public init(accessToken: String, tokenType: String, expiresIn: Int, expiresAt: Int, refreshToken: String, user: AuthUserModel) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        self.expiresAt = expiresAt
        self.refreshToken = refreshToken
        self.user = user
    }
    
    public enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case expiresAt = "expires_at"
        case refreshToken = "refresh_token"
        case user
    }
}
