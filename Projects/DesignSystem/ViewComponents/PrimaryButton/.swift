//
//  PrimaryButtonView.swift
//  DesignSystem
//
//  Created by Виталий Багаутдинов on 24.08.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import SwiftUI

public struct PrimaryButtonView: View {
    
    public enum Style {
        case primary
        case secondary
    }
    
    let title: String
    let style: Style
    let isLoading: Bool
    
    public init(title: String, style: Style, isLoading: Bool = false) {
        self.title = title
        self.style = style
        self.isLoading = isLoading
    }
    
    public var body: some View {
        Button {
            //
        } label: {
            labelButton()
        }

    }
    
    @ViewBuilder
    private func labelButton() -> some View {
        switch style {
        case .primary:
            Text("Jopasti")
                .foregroundStyle(foregroundColor())
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(backgroundColor())
                .cornerRadius(10)
        case .secondary:
            Text("Jopasti")
                .foregroundStyle(foregroundColor())
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color.black)
                }
        }
    }
    
    private func backgroundColor() -> Color {
        switch style {
        case .primary:
            return Color.black
        default:
            return Color.white
        }
    }
    
    private func foregroundColor() -> Color {
        switch style {
        case .primary:
            return Color.white
        default:
            return Color.black
        }
    }
    
}

#Preview {
    PrimaryButtonView(title: "Kokoro", style: .secondary)
}
