//
//  SignUpView.swift
//  AuthData
//
//  Created by Вадим Мартыненко on 10.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI

public struct SignUpView: View {
    @State private var viewModel: SignUpViewModel
    
    public init(viewModel: SignUpViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }
    
    public var body: some View {
        Text("hi")
    }
}

#Preview {
    SignUpView(
        viewModel: SignUpViewModel()
    )
}
