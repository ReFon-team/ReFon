//
//  UserDefaultsStorage.swift
//  Utilities
//
//  Created by Вадим Мартыненко on 16.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//
// swiftlint:disable:next foundation_using
import Foundation
import UtilitiesInterfaces

public final class UserDefaultsStorage: UserDefaultsStorageProtocol {
    private let userDefaults = UserDefaults.standard
    
    public init() {}
}

// MARK: - Getter

public extension UserDefaultsStorage {
    func string(forKey key: UserDefaultsKey) -> String? {
        userDefaults.string(forKey: key.rawValue)
    }
    
    func integer(forKey key: UserDefaultsKey) -> Int {
        userDefaults.integer(forKey: key.rawValue)
    }
    
    func bool(forKey key: UserDefaultsKey) -> Bool {
        userDefaults.bool(forKey: key.rawValue)
    }
}

// MARK: - Setter

public extension UserDefaultsStorage {
    func set(value: Any, forKey key: UserDefaultsKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
}
