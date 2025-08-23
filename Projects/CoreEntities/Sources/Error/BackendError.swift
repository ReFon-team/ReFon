//
//  BackendError.swift
//  CoreEntities
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import Foundation

public struct BackendError: Decodable, Error {
    public let code: Int
    public let errorCode: String
    public let message: String
    
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
