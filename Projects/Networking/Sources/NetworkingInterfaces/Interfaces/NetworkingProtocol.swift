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
    func fetch<T: Decodable, Error: Decodable> (
        returnType: T.Type,
        returnError: Error.Type,
        router: Router,
        additionalHeaders: [String: String]?
    ) async throws -> Result<T, Error>
    
    func fetchData(
        for urlString: String,
        method: HTTPMethod,
        additionalHeaders: [String: String]?
    ) async throws -> Data
    
    func uploadResource<T: Decodable, Error: Decodable>(
        uploadData data: Data,
        returnType: T.Type,
        returnError: Error.Type,
        router: Router,
        additionalHeaders: [String: String]?
    ) async throws -> Result<T, Error>
}
