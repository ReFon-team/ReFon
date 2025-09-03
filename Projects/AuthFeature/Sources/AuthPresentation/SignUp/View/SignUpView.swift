//
//  SignUpView.swift
//  AuthData
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct SignUpView: View {
    @State private var viewModel: SignUpViewModel
    
    public init(viewModel: SignUpViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            Spacer()
            
            Text(Strings.createAccount)
                .font(.system(size: 30))
                .fontWeight(.black)
            
            CustomTextFieldView(type: .email, text: $viewModel.email)
            CustomTextFieldView(type: .password, text: $viewModel.password)
            CustomTextFieldView(type: .confirmPassword, text: $viewModel.passwordConfirm)
            
            Button(Strings.createAccount) {
                //
            }
            .primaryButton(style: .fill)
            .padding(.top, 15)
            
            HStack(spacing: 16) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                
                Text(Strings.registerWith)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
            }.padding(.top, 15)
            
            Spacer()
        }
        .padding(20)
        .background(Color.white)
    }
}

#Preview {
    SignUpView(
        viewModel: SignUpViewModel()
    )
}
