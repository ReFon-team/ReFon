//
//  UserDefaultsStorageProtocol.swift
//  Utilities
//
//  Created by Вадим Мартыненко on 16.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

public enum UserDefaultsKey: String {
    case accessToken
}

public protocol UserDefaultsStorageProtocol: AnyObject {
    func string(forKey key: UserDefaultsKey) -> String?
    func integer(forKey key: UserDefaultsKey) -> Int?
    
    func set(value: Any, forKey key: UserDefaultsKey)
}
