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

public final class AuthAPIClient: AuthAPIClientProtocol {
    private let networking: NetworkingProtocol
    
    public init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    private enum Endpoint: Router {
        case signUp(_ email: String, _ password: String)
        
        var baseURL: String {
            Constants.baseURL + "/auth/v1"
        }
        
        var endpoint: String {
            switch self {
            case .signUp: return "/signup"
            }
        }
        
        var method: HTTPMethod {
            .post
        }
        
        var headers: [String: String]? { nil }
        
        var body: [String: String]? {
            switch self {
            case let .signUp(email, password):
                return [
                    "email": email,
                    "password": password
                ]
            }
        }
    }
    
    public func signUp(email: String, password: String) async throws -> AuthUserCredentials {
        let endpoint = Endpoint.signUp(email, password)
        
        let credentials = try await networking.fetch(returnType: AuthUserCredentials.self, router: endpoint, headers: [:])
        
        return credentials
    }
}
