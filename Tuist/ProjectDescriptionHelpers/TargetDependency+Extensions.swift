//
//  TargetDependency+Extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 09.08.2025.
//

import ProjectDescription

public extension TargetDependency {
    static func simple(_ module: SimpleModule) -> TargetDependency {
        .project(target: module.rawValue, path: module.path)
    }
    
    static func complex(_ module: ComplexModule, _ target: ComplexTargetType) -> TargetDependency {
        let name = target == .interfaces ? module.interfacesTargetName : module.rawValue
        return .project(target: name, path: module.path)
    }
    
    static func feature(_ feature: Feature, _ module: FeatureModule) -> TargetDependency {
        .project(target: module.targetName(for: feature), path: feature.path)
    }
    
    static func presentation(_ feature: Feature) -> TargetDependency {
        .feature(feature, .Presentation)
    }
    
    static func domain(_ feature: Feature) -> TargetDependency {
        .feature(feature, .Domain)
    }
    
    static func data(_ feature: Feature) -> TargetDependency {
        .feature(feature, .Data)
    }
}
