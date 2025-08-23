//
//  AuthVerifyCredentials.swift
//  CoreEntities
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import Common
import Foundation

public struct AuthVerifyCredentials: EndpointCredentials {
    public let type: TypeVerify
    public let token: String
    public let email: String
    
    public enum TypeVerify: String, Encodable {
        case email
    }
    
    public init(type: TypeVerify, token: String, email: String) {
        self.type = type
        self.token = token
        self.email = email
    }
}
