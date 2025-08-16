//
//  UtilitiesAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 16.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import Utilities
import UtilitiesInterfaces

final class UtilitiesAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(UserDefaultsStorageProtocol.self) { _ in
            UserDefaultsStorage()
        }
    }
}
