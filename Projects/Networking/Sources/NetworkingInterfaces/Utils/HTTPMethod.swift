//
//  HTTPMethod.swift
//  NetworkingInterfaces
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public enum HTTPMethod: String {
    case get, post, put, delete
    
    public func getMethod() -> String {
        rawValue
    }
}
