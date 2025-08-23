//
//  BackendNetworkingProtocol.swift
//  Utilities
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import Common
import Foundation
import NetworkingInterfaces

public protocol BackendNetworkingProtocol: AnyObject {
    func fetch<T: Decodable> (
        returnType: T.Type,
        router: Router,
        headers: [String: String]
    ) async throws -> Result<T, BackendError>
    
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
    ) async throws -> Result<T, BackendError>
}
