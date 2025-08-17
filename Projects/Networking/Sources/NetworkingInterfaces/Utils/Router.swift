//
//  Router.swift
//  NetworkingInterfaces
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation

public protocol Router {
    var baseURL: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
}

public extension Router {
    func makeURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + "/" + endpoint) else { throw NetworkError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = method.getMethod()
        
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }
}
