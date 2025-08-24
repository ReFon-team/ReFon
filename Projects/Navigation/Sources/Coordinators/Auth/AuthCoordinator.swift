//
//  AuthCoordinator.swift
//  Navigation
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights

import DI
import AuthPresentation
import Observation
import SwiftUI

@Observable
public final class AuthCoordinator {
    enum Screen: String, CaseIterable {
        case onboarding, signUp
        
        var id: String { rawValue }
    }
    
    var path = NavigationPath()
    
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel())
        case .signUp:
            SignUpView(
                viewModel: SignUpViewModel()
            )
        }
    }
}
