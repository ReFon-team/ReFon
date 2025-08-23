//
//  AuthAPIClient.swift
//  DataSources
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import NetworkingInterfaces
import DataSourcesInterfaces
import Common
import CoreEntities
import UtilitiesInterfaces

public final class AuthAPIClient: AuthAPIClientProtocol {
    private let networking: BackendNetworkingProtocol
    
    public init(networking: BackendNetworkingProtocol) {
        self.networking = networking
    }
    
    private enum Endpoint: Router {
        case signUp(_ credentials: AuthUserCredentials)
        case verify(_ credentials: AuthVerifyCredentials)
        case signInByPassword(_ credentials: AuthUserCredentials)
        case recoverPassword(_ credentials: AuthRecoverPasswordCredenials)
        
        var baseURL: String {
            AppConstants.Backend.baseURL + "/auth/v1"
        }
        
        var endpoint: String {
            switch self {
            case .signUp: return "/signup"
            case .verify: return "/verify"
            case .signInByPassword: return "/token?grant_type=password"
            case .recoverPassword: return "recover"
            }
        }
        
        var method: HTTPMethod {
            .post
        }
        
        var headers: [String: String]? { nil }
        
        var body: EndpointCredentials? {
            switch self {
            case let .signUp(credentials): return credentials
            case let .verify(credentials): return credentials
            case let .signInByPassword(credentials): return credentials
            case let .recoverPassword(credentials): return credentials
            }
        }
    }
    
    public func signUp(credentials: AuthUserCredentials) async throws -> Result<AuthUserModel, BackendError> {
        let endpoint = Endpoint.signUp(credentials)
        
        let result = try await networking.fetch(returnType: AuthUserModel.self, router: endpoint, additionalHeaders: nil)
        
        return result
    }
    
    public func verify(credentials: AuthVerifyCredentials) async throws -> Result<AuthTokensResponse, BackendError> {
        let endpoint = Endpoint.verify(credentials)
        
        let result = try await networking.fetch(returnType: AuthTokensResponse.self, router: endpoint, additionalHeaders: nil)
        
        return result
    }
    
    public func signInByPassword(credentials: AuthUserCredentials) async throws -> Result<AuthTokensResponse, BackendError> {
        let endpoint = Endpoint.signInByPassword(credentials)
        
        let result = try await networking.fetch(returnType: AuthTokensResponse.self, router: endpoint, additionalHeaders: nil)
        
        return result
    }
    
    public func recoverPassword(credentials: AuthRecoverPasswordCredenials) async throws -> OperationResult<BackendError> {
        let endpoint = Endpoint.recoverPassword(credentials)
        
        let result = try await networking.fetch(router: endpoint, additionalHeaders: nil)
        
        return result
    }
}
