//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Виталий Багаутдинов on 24.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    public enum Style {
        case primary
        case secondary
        
        var backgroundColor: Color {
            switch self {
            case .primary:
                return .black
            case .secondary:
                return .white
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .primary:
                return .white
            case .secondary:
                return .black
            }
        }
        
        var borderColor: Color {
            switch self {
            case .primary:
                return .clear
            case .secondary:
                return .black
            }
        }
    }
    
    let style: Style
    let isLoading: Bool
    let fontSize: CGFloat
    
    public init(
        style: Style,
        isLoading: Bool = false,
        fontSize: CGFloat = 16
    ) {
        self.style = style
        self.isLoading = isLoading
        self.fontSize = fontSize
    }
    
    var isDisabled: Bool {
        isLoading
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        buttonStyle(configuration)
    }
    
    @ViewBuilder
    private func buttonStyle(_ configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: fontSize, weight: .bold))
            .foregroundColor(style.foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(style.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder()
            )
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .opacity(isLoading ? 0.3 : 1.0)
            .overlay {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                }
            }
            .contentShape(Rectangle())
            .allowsHitTesting(!isDisabled)
    }
    
}

// MARK: - Button Extension

public extension Button {
    func primaryButton(
        style: PrimaryButtonStyle.Style,
        isLoading: Bool = false,
        fontSize: CGFloat = 16
    ) -> some View {
        buttonStyle(
            PrimaryButtonStyle(
                style: style,
                isLoading: isLoading,
                fontSize: fontSize
            )
        )
    }
}

// MARK: - Превью
#Preview {
    VStack(spacing: 20) {
        // Основная кнопка
        Button("Основная кнопка") {
            print("Нажата основная кнопка")
        }
        .primaryButton(style: .primary)
        
        // Вторичная кнопка
        Button("Вторичная кнопка") {
            print("Нажата вторичная кнопка")
        }
        .primaryButton(style: .secondary)
        
        // Кнопка с загрузкой
        Button("Кнопка с загрузкой") {
            print("Нажата кнопка с загрузкой")
        }
        .primaryButton(style: .primary, isLoading: true)
    }
    .padding()
}
