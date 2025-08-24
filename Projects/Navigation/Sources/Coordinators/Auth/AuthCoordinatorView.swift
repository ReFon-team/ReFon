//
//  AuthCoordinatorView.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI

struct AuthCoordinatorView: View {
    @State private var coordinator: AuthCoordinator
    
    init(coordinator: AuthCoordinator) {
        self._coordinator = State(wrappedValue: coordinator)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(screen: .onboarding)
                .navigationDestination(for: AuthCoordinator.Screen.self) { screen in
                    coordinator.build(screen: screen)
                }
        }
    }
}
