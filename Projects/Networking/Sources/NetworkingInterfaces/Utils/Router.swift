//
//  Router.swift
//  NetworkingInterfaces
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation
import Common

public protocol Router {
    var baseURL: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
}

public extension Router {
    func makeURLRequest(with inputHeaders: [String: String] = [:]) throws -> URLRequest {
        guard let url = URL(string: baseURL + "/" + endpoint) else { throw NetworkError.invalidURL }
        
        var allHeaders = headers.merging(inputHeaders) { current, _ in return current }
        
        var request = URLRequest(url: url)
        request.setMethod(method)
        request.setHeaders(headers)
        
        return request
    }
}
