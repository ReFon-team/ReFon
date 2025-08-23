//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import DI
import Observation
import SwiftUI

@Observable
public final class AppCoordinator {
    enum Feature: String, Identifiable {
        case privateZone
        
        var id: String { rawValue }
    }
    
    var fullScreenCover: Feature?
    
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func build(feature: Feature) -> some View {
        switch feature {
        case .privateZone:
            AuthCoordinatorView(
                coordinator: AuthCoordinator(resolver: resolver)
            )
        }
    }
}
