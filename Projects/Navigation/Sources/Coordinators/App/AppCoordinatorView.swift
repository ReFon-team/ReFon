//
//  AppCoordinatorView.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI

public struct AppCoordinatorView: View {
    @State private var coordinator: AppCoordinator
    
    public init(coordinator: AppCoordinator) {
        self._coordinator = State(wrappedValue: coordinator)
    }
    
    public var body: some View {
        coordinator.build(feature: .privateZone)
            .fullScreenCover(item: $coordinator.fullScreenCover) { feature in
                coordinator.build(feature: feature)
            }
    }
}
