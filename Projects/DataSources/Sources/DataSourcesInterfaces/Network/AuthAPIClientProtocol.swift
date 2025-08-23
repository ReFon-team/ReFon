//
//  AuthAPIClientProtocol.swift
//  DataSources
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreEntities

public protocol AuthAPIClientProtocol: AnyObject {
    func signUp(email: String, password: String) async throws -> Result<AuthUserModel, BackendError>
}
