//
//  CustomTextFieldView.swift
//  DesignSystem
//
//  Created by Виталий Багаутдинов on 25.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI
import Common

public struct CustomTextFieldView: View {
    
    public enum TextFieldType: String {
        case email = "Email"
        case password = "Create a password"
        case confirmPassword = "Confirm password"
    }
    
    let type: TextFieldType
    @Binding var text: String
    
    public init(type: TextFieldType, text: Binding<String>) {
        self.type = type
        self._text = text
    }
    
    @State private var eye: Bool = false
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(type.rawValue)")
                .padding(.trailing, 5)
                .frame(minWidth: 80, alignment: .leading)
            
            textFieldWithEyeIfNeeded()
            
            if type == .email && !isEmailValid && !text.isEmpty {
                Text(Strings.Error.email)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 4)
            }
            
            if let passwordMessage = passwordValidationMessage {
                Text(passwordMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 4)
            }
        }
    }
}

extension CustomTextFieldView {
    
    private var example: String {
        switch type {
        case .email:
            "example@gmail.com"
        case .password:
            "must be 6 characters"
        case .confirmPassword:
            "repeat password"
        }
    }
    
    private var isPasswordField: Bool {
        type == .password || type == .confirmPassword
    }
    
    private var textContentType: UITextContentType? {
        switch type {
        case .email:
            return .emailAddress
        case .password:
            return .newPassword
        case .confirmPassword:
            return .newPassword
        }
    }
    
    private var isEmailValid: Bool {
        if type == .email {
            return text.isNotEmpty && text.isValidEmail
        }
        return true
    }
    
    private var passwordValidationMessage: String? {
        guard type == .password || type == .confirmPassword else { return nil }
        guard text.isNotEmpty else { return nil }
        
        var missingRequirements: [String] = []
        
        if !text.isLowercase {
            missingRequirements.append(Strings.Error.Password.lowercase)
        }
        if !text.isUppercase {
            missingRequirements.append(Strings.Error.Password.uppercase)
        }
        if !text.isNumber{
            missingRequirements.append(Strings.Error.Password.number)
        }
        if !text.isSpecialCharacter{
            missingRequirements.append(Strings.Error.Password.specialSymbol)
        }
        if !text.isMinLength(6){
            missingRequirements.append(Strings.Error.Password.minLenght)
        }
        
        if !missingRequirements.isEmpty {
            return Strings.Error.Password.notEnough + String.colon + missingRequirements.joined(separator: String.comma)
        }
        
        return nil
    }
    
    private var borderColor: Color {
        
        switch type {
        case .email:
            if text.isNotEmpty && !text.isValidEmail {
                return .red
            }
            return Asset.Colors.borderColor.swiftUIColor
        case .password, .confirmPassword:
            if passwordValidationMessage != nil {
                return .red
            }
            return Asset.Colors.borderColor.swiftUIColor
        }
    }
    
    @ViewBuilder
    private func textFieldWithEyeIfNeeded() -> some View {
        if isPasswordField {
            ZStack {
                passwordTextField
                eyeButton
            }
        } else {
            TextField(example, text: $text)
                .textContentType(textContentType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .modifier(BorderModifier(color: borderColor))
                .animation(.easeInOut(duration: 0.3), value: borderColor)
        }
    }

    private var passwordTextField: some View {
        Group {
            if !eye {
                SecureField(example, text: $text)
                    .textContentType(textContentType)
            } else {
                TextField(example, text: $text)
                    .textContentType(textContentType)
            }
        }
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .padding()
        .padding(.trailing, 30)
        .modifier(BorderModifier(color: borderColor))
        .animation(.easeInOut(duration: 0.3), value: borderColor)
    }

    private var eyeButton: some View {
        HStack {
            Spacer()
            Button {
                eye.toggle()
            } label: {
                Image(systemName: eye ? "eye.slash" : "eye")
                    .foregroundStyle(Color.black)
            }
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        CustomTextFieldView(type: .email, text: .constant("invalid@email"))
        CustomTextFieldView(type: .password, text: .constant("weak"))
        CustomTextFieldView(type: .confirmPassword, text: .constant(""))
    }
    .padding()
}
