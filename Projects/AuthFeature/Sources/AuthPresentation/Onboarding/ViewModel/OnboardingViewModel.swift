//
//  OnboardingViewModel.swift
//  AuthPresentation
//
//  Created by Виталий Багаутдинов on 24.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI
import Common

@Observable
public final class OnboardingViewModel {
    private let onNavigationRegister: VoidAction
    private let onNavigationSignIn: VoidAction
    
    public init(onNavigationRegister: @escaping VoidAction, onNavigationSignIn: @escaping VoidAction) {
        self.onNavigationRegister = onNavigationRegister
        self.onNavigationSignIn = onNavigationSignIn
    }
    
    func pressButtonCreateAccount() {
        onNavigationRegister()
    }
    
    func pressButtonSignIn() {
        onNavigationSignIn()
    }
    
}
