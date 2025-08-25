//
//  BorderModifier.swift
//  DesignSystem
//
//  Created by Виталий Багаутдинов on 25.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI


public struct BottomBorderModifier: ViewModifier {
    
    var color: Color
    private var height: CGFloat = 2
    
    public init(color: Color = .black) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: 2)
            )
    }
}
