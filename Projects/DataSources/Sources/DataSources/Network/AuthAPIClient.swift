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
        case signUp(_ email: String, _ password: String)
        
        var baseURL: String {
            AppConstants.Backend.baseURL + "/auth/v1"
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
        
        var body: EndpointCredentials? {
            switch self {
            case let .signUp(email, password):
                return AuthUserCredentials(email: email, password: password)
            }
        }
    }
    
    public func signUp(email: String, password: String) async throws -> Result<AuthUserModel, BackendError> {
        let endpoint = Endpoint.signUp(email, password)
        
        let result = try await networking.fetch(returnType: AuthUserModel.self, router: endpoint, additionalHeaders: nil)
        
        return result
    }
}
