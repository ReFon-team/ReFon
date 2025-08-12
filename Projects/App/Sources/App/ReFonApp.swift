//
//  App.swift
//  App
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI
import DI
import Navigation

@main
struct ReFonApp: App {
    private let resolver: Resolver
    
    init() {
        self.resolver = DIConfigurator.configure(with: [])
    }
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: AppCoordinator(resolver: resolver))
        }
    }
}
