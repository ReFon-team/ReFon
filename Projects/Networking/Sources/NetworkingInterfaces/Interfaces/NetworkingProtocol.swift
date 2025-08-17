//
//  NetworkingInterfaces.swift
//  Networking
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation
import Common

public protocol NetworkingProtocol: AnyObject {
    func fetch<T: Decodable>(
        returnType: T.Type,
        router: Router,
        headers: [String: String]
    ) async throws -> T
    
    func fetchData(
        for urlString: String,
        method: HTTPMethod,
        headers: [String: String]
    ) async throws -> Data
    
    func uploadResource<T: Decodable>(
        uploadData data: Data,
        returnType: T.Type,
        router: Router,
        headers: [String: String]
    ) async throws -> T
}
