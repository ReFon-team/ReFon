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
import NetworkingInterfaces

final class UtilitiesAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(UserDefaultsStorageProtocol.self) { _ in
            UserDefaultsStorage()
        }
        
        container.register(BackendNetworkingProtocol.self) { resolver in
            BackendNetworking(
                networking: resolver.resolve(NetworkingProtocol.self)!
            )
        }
    }
}
