//
//  ProxyNetworking.swift
//  Utilities
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation
import NetworkingInterfaces
import UtilitiesInterfaces
import Common

public final class AuthNetworkingProxy: NetworkingProtocol {
    // swiftlint:disable:next identifier_name
    private let ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRyZnBxbHl5Y3Rhd3ZlYXVibWF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ2Njc1NDUsImV4cCI6MjA3MDI0MzU0NX0.gpad7U4zEQMgDa6_IezLHqVIKuSjgbMRreFFaEUdQ4M"
    
    private let networking: NetworkingProtocol
    private let userDefaultsStorage: UserDefaultsStorageProtocol
    
    public init(networking: NetworkingProtocol, userDefaultsStorage: UserDefaultsStorageProtocol) {
        self.networking = networking
        self.userDefaultsStorage = userDefaultsStorage
    }
    
    public func fetch<T: Decodable>(
        returnType: T.Type,
        router: Router,
        headers: [String : String]
    ) async throws -> T {
        let allHeaders = mergeHeadersWithTokenHeaders(headers)
        return try await networking.fetch(returnType: returnType, router: router, headers: allHeaders)
    }
    
    public func fetchData(
        for urlString: String,
        method: Common.HTTPMethod,
        headers: [String : String]
    ) async throws -> Data {
        let allHeaders = mergeHeadersWithTokenHeaders(headers)
        return try await networking.fetchData(for: urlString, method: method, headers: allHeaders)
    }
    
    public func uploadResource<T: Decodable>(
        uploadData data: Data,
        returnType: T.Type,
        router: Router,
        headers: [String : String]
    ) async throws -> T {
        let allHeaders = mergeHeadersWithTokenHeaders(headers)
        return try await networking.uploadResource(
            uploadData: data,
            returnType: returnType,
            router: router,
            headers: allHeaders
        )
    }
}

// MARK: - Private Methods

private extension AuthNetworkingProxy {
    func mergeHeadersWithTokenHeaders(_ headers: [String: String]) -> [String: String] {
        let tokenHeaders = getTokenHeaders()
        return headers.merging(tokenHeaders) { current, _ in current}
    }
    
    func getTokenHeaders() -> [String: String] {
        var headers: [String: String] = [:]
        
        if let token = userDefaultsStorage.string(forKey: .bearerToken) {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        headers["apikey"] = ANON_KEY
        
        return headers
    }
}
