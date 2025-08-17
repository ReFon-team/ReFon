//
//  Networking.swift
//  Networking
//
//  Created by Вадим Мартыненко on 17.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation
import NetworkingInterfaces
import Common

public final class Networking: NetworkingProtocol {
    private let urlSession: URLSession
    
    public init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        configuration.allowsCellularAccess = true
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        self.urlSession = URLSession(configuration: configuration)
    }
    
    public func fetch<T: Decodable>(
        returnType: T.Type,
        router: Router,
        headers: [String: String] = [:]
    ) async throws -> T {
        let request = try router.makeURLRequest(with: headers)
        
        let (data, response) = try await urlSession.data(for: request)
        
        try handleResponse(response)
        
        return try decode(data: data, to: returnType)
    }
    
    public func fetchData(
        for urlString: String,
        method: HTTPMethod = .get,
        headers: [String: String] = [:]
    ) async throws -> Data {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.setMethod(method)
        request.setHeaders(headers)
        
        let (data, response) = try await urlSession.data(for: request)
        
        try handleResponse(response)
        
        return data
    }
    
    public func uploadResource<T: Decodable>(
        uploadData data: Data,
        returnType: T.Type,
        router: Router,
        headers: [String: String] = [:]
    ) async throws -> T {
        let request = try router.makeURLRequest(with: headers)
        
        let (data, response) = try await urlSession.upload(for: request, from: data)
        
        try handleResponse(response)
        
        return try decode(data: data, to: returnType)
    }
}

// MARK: - Private Methods

private extension Networking {
    func decode<T: Decodable>(data: Data, to returnType: T.Type) throws -> T {
        do {
            let decodedData = try JSONDecoder().decode(returnType, from: data)
            return decodedData
        } catch {
            throw NetworkError.dataConversionFailure
        }
    }
    
    func handleResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
       
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed(statusCode: httpResponse.statusCode)
        }
    }
}
