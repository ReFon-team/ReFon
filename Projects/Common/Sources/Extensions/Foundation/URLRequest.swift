//
//  URLRequest.swift
//  Common
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import Foundation

public extension URLRequest {
    mutating func setMethod(_ method: HTTPMethod) {
        self.httpMethod = method.getMethod()
    }
    
    mutating func setHeaders(_ headers: [String: String]) {
        for header in headers {
            self.setValue(header.value, forHTTPHeaderField: header.key)
        }
    }
    
    mutating func setBody(_ body: [String: String]) {
        httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    }
}
