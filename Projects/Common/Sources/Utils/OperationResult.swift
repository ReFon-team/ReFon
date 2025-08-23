//
//  OperationResult.swift
//  Common
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public enum OperationResult<Failure: Error> {
    case success
    case failure(Failure)
}
