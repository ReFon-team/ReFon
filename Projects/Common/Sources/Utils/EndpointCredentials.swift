//
//  EndpointCredentials.swift
//  Common
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

// swiftlint:disable:next foundation_using
import Foundation

public protocol EndpointCredentials: Encodable {
    func toData() -> Data?
}

public extension EndpointCredentials {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
