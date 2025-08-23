//
//  AuthAPIClientProtocol.swift
//  DataSources
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities
import Common

public protocol AuthAPIClientProtocol: AnyObject {
    func signUp(credentials: AuthUserCredentials) async throws -> Result<AuthUserModel, BackendError>
    
    func verify(credentials: AuthVerifyCredentials) async throws -> Result<AuthTokensResponse, BackendError>
    
    func signInByPassword(credentials: AuthUserCredentials) async throws -> Result<AuthTokensResponse, BackendError>
    
    func recoverPassword(credentials: AuthRecoverPasswordCredenials) async throws -> OperationResult<BackendError>
}
