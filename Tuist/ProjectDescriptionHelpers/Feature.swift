//
//  Feature.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 09.08.2025.
//

import ProjectDescription

public enum Feature: String, CaseIterable, ProjectProtocol {
    case Ads, Profile, Auth, Chat
    
    public var title: String { rawValue + "Feature" }
    
    public func dependencies(for modules: FeatureModule...) -> [TargetDependency] {
        modules.map { .feature(self, $0) }
    }
    
    public static func allDependenciesForApp() -> [TargetDependency] {
        return allCases.map {
            $0.dependencies(for: .Data, .DataInterfaces, .Domain, .DomainInterfaces)
        }.flatMap { $0 }
    }
    
    public static func allDependenciesForLogger() -> [TargetDependency] {
        allDependenciesForApp()
    }
}

