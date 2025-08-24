//
//  BackendError.swift
//  CoreEntities
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation

public struct BackendError: Decodable, Error {
    public let code: Int
    public let errorCode: String
    public let message: String
    
    public var typeError: TypeError {
        TypeError.typeError(from: errorCode)
    }
    
    public enum TypeError: String {
        case unknown
        case invalidEmailFormat = "validation_failed"
        case tokenHasExpiredOrIsInvalid = "otp_expired"
        case invalidCredentials = "invalid_credentials"
        case weakPassword = "weak_password"
        
        public static func typeError(from errorCode: String) -> TypeError {
            TypeError(rawValue: errorCode) ?? .unknown
        }
    }
    
    public init(code: Int, errorCode: String, message: String) {
        self.code = code
        self.errorCode = errorCode
        self.message = message
    }
    
    public enum CodingKeys: String, CodingKey {
        case code
        case errorCode = "error_code"
        case message = "msg"
    }
}
