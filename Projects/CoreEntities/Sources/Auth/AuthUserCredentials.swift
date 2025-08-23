//
//  User.swift
//  CoreEntities
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import Foundation

public struct AuthUserCredentials: Decodable {
    public let id: UUID
    public let email: String
    public let createdAt: Date
    public let confirmationSentAt: Date
    
    public init(id: UUID, email: String, createdAt: Date, confirmationSentAt: Date) {
        self.id = id
        self.email = email
        self.createdAt = createdAt
        self.confirmationSentAt = confirmationSentAt
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case email
        case createdAt = "created_at"
        case confirmationSentAt = "confirmation_sent_at"
    }
}
