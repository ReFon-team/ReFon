//
//  FeatureModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 09.08.2025.
//

import ProjectDescription

public enum FeatureModule: String, CaseIterable {
    case Presentation, Domain, Data, DomainInterfaces, DataInterfaces
    
    public func targetName(for feature: Feature) -> String {
        feature.rawValue + rawValue
    }
    
    public func sources(for feature: Feature) -> SourceFilesList {
        ["Sources/\(targetName(for: feature))/**"]
    }
    
    public func dependencies(for feature: Feature) -> [TargetDependency] {
        switch self {
        case .Presentation:
            return [
                .feature(feature, .DomainInterfaces)
            ]
        case .Domain:
            return [
                .feature(feature, .DataInterfaces),
                .feature(feature, .DomainInterfaces)
            ]
        case .Data:
            return [
                .feature(feature, .DataInterfaces)
            ]
        case .DomainInterfaces:
            return []
        case .DataInterfaces:
            return []
        }
    }
    
    public var product: Product { .framework }
}
