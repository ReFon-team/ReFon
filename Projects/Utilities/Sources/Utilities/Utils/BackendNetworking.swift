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
import CoreEntities

public final class BackendNetworking: BackendNetworkingProtocol {
    // swiftlint:disable:next identifier_name line_length
    private let ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRyZnBxbHl5Y3Rhd3ZlYXVibWF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ2Njc1NDUsImV4cCI6MjA3MDI0MzU0NX0.gpad7U4zEQMgDa6_IezLHqVIKuSjgbMRreFFaEUdQ4M"
    
    private let networking: NetworkingProtocol
    
    public init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    public func fetch<T: Decodable>(
        returnType: T.Type,
        router: Router,
        additionalHeaders: [String: String]?
    ) async throws -> Result<T, BackendError> {
        let allHeaders = mergeWithAPIKeyHeaders(additionalHeaders)
        
        return try await networking.fetch(
            returnType: returnType,
            returnError: BackendError.self,
            router: router,
            additionalHeaders: allHeaders
        )
    }
    
    public func fetch(
        router: Router,
        additionalHeaders: [String : String]?
    ) async throws -> OperationResult<BackendError> {
        let allHeaders = mergeWithAPIKeyHeaders(additionalHeaders)
        
        return try await networking.fetch(
            returnError: BackendError.self,
            router: router,
            additionalHeaders: allHeaders
        )
    }
    
    public func fetchData(
        for urlString: String,
        method: Common.HTTPMethod,
        additionalHeaders: [String: String]?
    ) async throws -> Data {
        let allHeaders = mergeWithAPIKeyHeaders(additionalHeaders)
        
        return try await networking.fetchData(
            for: urlString,
            method: method,
            additionalHeaders: allHeaders
        )
    }
    
    public func uploadResource<T: Decodable>(
        uploadData data: Data,
        returnType: T.Type,
        router: Router,
        additionalHeaders: [String: String]?
    ) async throws -> Result<T, BackendError> {
        let allHeaders = mergeWithAPIKeyHeaders(additionalHeaders)
        
        return try await networking.uploadResource(
            uploadData: data,
            returnType: returnType,
            returnError: BackendError.self,
            router: router,
            additionalHeaders: allHeaders
        )
    }
}

// MARK: - Private Methods

private extension BackendNetworking {
    func mergeWithAPIKeyHeaders(_ headers: [String: String]?) -> [String: String] {
        let apiKeyHeaders = getAPIKeyHeaders()
        
        guard let headers else { return apiKeyHeaders }
        
        return headers.merging(apiKeyHeaders) { current, _ in current}
    }
    
    func getAPIKeyHeaders() -> [String: String] {
        var headers: [String: String] = [:]
        headers["apikey"] = ANON_KEY
        return headers
    }
}
