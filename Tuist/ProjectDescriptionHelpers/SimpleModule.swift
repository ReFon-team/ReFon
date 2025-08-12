//
//  SimpleModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 09.08.2025.
//

import ProjectDescription

public enum SimpleModule: String, ProjectProtocol {
    case App, Common, CoreEntities, DesignSystem, DI, Navigation, Analytics, Logger
    
    public var title: String { rawValue }
    
    public var product: Product {
        self == .App ? .app : .framework
    }
    
    public var scripts: [TargetScript] {
        self == .DesignSystem ? [.swiftgen()] : []
    }
}
