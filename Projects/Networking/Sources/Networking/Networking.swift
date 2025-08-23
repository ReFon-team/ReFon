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
    
    public func fetch<T: Decodable, Error: Decodable>(
        returnType: T.Type,
        returnError: Error.Type,
        router: Router,
        additionalHeaders: [String: String]? = nil
    ) async throws -> Result<T, Error> {
        let request = try router.makeURLRequest(with: additionalHeaders)
        
        let (data, response) = try await urlSession.data(for: request)
        
        try handleResponse(response)
        
        return try decode(data: data, returnType: returnType, returnError: returnError)
    }
    
    public func fetchData(
        for urlString: String,
        method: HTTPMethod = .get,
        additionalHeaders: [String: String]? = nil
    ) async throws -> Data {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.setMethod(method)
        request.setHeaders(additionalHeaders)
        
        let (data, response) = try await urlSession.data(for: request)
        
        try handleResponse(response)
        
        return data
    }
    
    public func uploadResource<T: Decodable, Error: Decodable>(
        uploadData data: Data,
        returnType: T.Type,
        returnError: Error.Type,
        router: Router,
        additionalHeaders: [String: String]? = nil
    ) async throws -> Result<T, Error> {
        let request = try router.makeURLRequest(with: additionalHeaders)
        
        let (data, response) = try await urlSession.upload(for: request, from: data)
        
        try handleResponse(response)
        
        return try decode(data: data, returnType: returnType, returnError: returnError)
    }
}

// MARK: - Private Methods

private extension Networking {
    func decode<T: Decodable, Error: Decodable>(data: Data, returnType: T.Type, returnError: Error.Type) throws -> Result<T, Error> {
        if let decodedData = try? JSONDecoder().decode(returnType, from: data) {
            return .success(decodedData)
        }
        
        if let decodedError = try? JSONDecoder().decode(returnError, from: data) {
            return .failure(decodedError)
        }
        
        throw NetworkError.dataConversionFailure
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
