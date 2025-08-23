//
//  URLRequest.swift
//  Common
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation

public extension URLRequest {
    mutating func setMethod(_ method: HTTPMethod) {
        self.httpMethod = method.getMethod()
    }
    
    mutating func setHeaders(_ headers: [String: String]?) {
        guard let headers else { return }
        
        for header in headers {
            self.setValue(header.value, forHTTPHeaderField: header.key)
        }
    }
    
    mutating func setBody(_ body: Data?) {
        httpBody = body
    }
}
