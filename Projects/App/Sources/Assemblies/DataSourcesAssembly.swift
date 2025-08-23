//
//  DataSourcesAssembly.swift
//  App
//
//  Created by Вадим Мартыненко on 23.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import DataSources
import DataSourcesInterfaces
import UtilitiesInterfaces

final class DataSourcesAssembly: Assembly {
    func assemble(container: Registration) {
        container.register(AuthAPIClientProtocol.self) { resolver in
            AuthAPIClient(
                networking: resolver.resolve(BackendNetworkingProtocol.self)!
            )
        }
    }
}
