//
//  CustomTextFieldView.swift
//  DesignSystem
//
//  Created by Виталий Багаутдинов on 25.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI

public struct CustomTextFieldView: View {
    
    public enum TextFieldType: String {
        case username = "Username"
        case password = "Password"
        case confirmPassword = "Confirm Password"
    }
    
    let type: TextFieldType
    @Binding var text: String
    
    public init(type: TextFieldType, text: Binding<String>) {
        self.type = type
        self._text = text
    }
    
    @State private var eye: Bool = false
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("\(type.rawValue):")
                .padding(.trailing, 5)
                .frame(minWidth: 80, alignment: .leading)
            
            textFieldWithEyeIfNeeded()
        }
        .padding(10)
    }
}

extension CustomTextFieldView {
    @ViewBuilder
    private func textFieldWithEyeIfNeeded() -> some View {
        if type == .password || type == .confirmPassword {
            ZStack {
                passwordTextField
                eyeButton
            }
        } else {
            TextField(type.rawValue, text: $text)
                .padding()
                .modifier(BottomBorderModifier(color: Asset.Colors.borderColor.swiftUIColor))
        }
    }

    private var passwordTextField: some View {
        Group {
            if !eye {
                SecureField(type.rawValue, text: $text)
            } else {
                TextField(type.rawValue, text: $text)
            }
        }
        .padding()
        .padding(.trailing, 30)
        .modifier(BottomBorderModifier(color: Asset.Colors.borderColor.swiftUIColor))
    }

    private var eyeButton: some View {
        HStack {
            Spacer()
            Button {
                eye.toggle()
            } label: {
                Image(systemName: eye ? "eye.slash" : "eye")
            }
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    CustomTextFieldView(type: .username, text: .constant(""))
}
