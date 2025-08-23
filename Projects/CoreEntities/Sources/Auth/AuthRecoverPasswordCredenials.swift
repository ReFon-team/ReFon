//
//  AuthRecoveryCredenials.swift
//  CoreEntities
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import Common

public struct AuthRecoverPasswordCredenials: EndpointCredentials {
    public let password: String
    
    public init(password: String) {
        self.password = password
    }
}
