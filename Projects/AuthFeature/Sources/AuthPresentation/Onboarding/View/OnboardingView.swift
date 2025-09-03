//
//  OnboardingView.swift
//  AuthPresentation
//
//  Created by Виталий Багаутдинов on 24.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct OnboardingView: View {
    
    @State private var viewModel: OnboardingViewModel
    
    public init(viewModel: OnboardingViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack {
            Spacer()
            
            Image(uiImage: Asset.Images.onboardingStartImage.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 300)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text(Strings.Onboarding.title)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
                
                Text(Strings.Onboarding.subtitle)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.black.opacity(0.6))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
            }
            
            Spacer()
            
            VStack(spacing: 12) {
                Button(Strings.signIn) {
                    viewModel.pressButtonSignIn()
                }
                .primaryButton(style: .fill)
                
                Button(Strings.createAccount) {
                    viewModel.pressButtonCreateAccount()
                }
                .primaryButton(style: .border)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
        .background(Color.white)
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(onNavigationRegister: {}, onNavigationSignIn: {}))
}
