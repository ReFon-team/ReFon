//
//  BorderModifier.swift
//  DesignSystem
//
//  Created by Виталий Багаутдинов on 28.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI

public struct BorderModifier: ViewModifier {
    public enum TypeBorder {
        case rounded
        case stroke
    }
    
    public var color: Color
    private var height: CGFloat = 2
    public let type: TypeBorder
    
    public init(color: Color = .black, type: TypeBorder = .rounded) {
        self.color = color
        self.type = type
    }
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    switch type {
                    case .rounded:
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(color, lineWidth: 2)
                    case .stroke:
                        Rectangle().stroke(color, lineWidth: 1)
                    }
                }
            )
    }
}

// MARK: - View Extension

public extension View {
    func border(color: Color = .black, type: BorderModifier.TypeBorder = .rounded) -> some View {
        modifier(BorderModifier(color: color, type: type))
    }
}
