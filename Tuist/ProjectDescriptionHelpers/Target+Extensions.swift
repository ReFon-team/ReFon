//
//  Target+Extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 09.08.2025.
//

import ProjectDescription

public extension Target {
    static func feature(
        feature: Feature,
        module: FeatureModule,
        dependencies: [TargetDependency]
    ) -> Target {
        
        var currentDependencies = dependencies
        
        let moduleDependencies = module.dependencies(for: feature)
        currentDependencies.append(contentsOf: moduleDependencies)
        
        return .target(
            name: module.targetName(for: feature),
            destinations: .iOS,
            product: module.product,
            productName: module.targetName(for: feature),
            bundleId: Constants.BUNDLE_ID + "." + module.targetName(for: feature),
            deploymentTargets: .iOS(Constants.MIN_TARGET_IOS),
            infoPlist: .default,
            sources: module.sources(for: feature),
            scripts: [.swiftlint(countInnerFolder: 0)],
            dependencies: currentDependencies
        )
    }
    
    static func simple(
        _ module: SimpleModule,
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Target {
        var infoPlist: InfoPlist = .default
        
        if module == .App {
            infoPlist = Constants.DEFAULT_INFO_PLIST
        }
        
        return .target(
            name: module.rawValue,
            destinations: .iOS,
            product: module.product,
            productName: module.rawValue,
            bundleId: Constants.BUNDLE_ID + "." + module.rawValue,
            deploymentTargets: .iOS(Constants.MIN_TARGET_IOS),
            infoPlist: infoPlist,
            sources: ["Sources/**"],
            resources: resources,
            scripts: [.swiftlint(countInnerFolder: 0)] + module.scripts,
            dependencies: dependencies
        )
    }
    
    static func complex(
        _ module: ComplexModule,
        target: ComplexTargetType,
        automaticallyAppendInterfaceTarget: Bool = true,
        dependencies: [TargetDependency] = [],
        coreDataModels: [CoreDataModel]? = nil
    ) -> Target {
        var allDependencies = dependencies
        let name = target == .interfaces ? module.interfacesTargetName : module.rawValue
        let sources: SourceFilesList = ["Sources/\(name)/**"]
        
        var countInnerFolder = 1
        
        if module.rootFolder != nil {
            countInnerFolder += 1
        }
        
        if automaticallyAppendInterfaceTarget && target == .impl {
            allDependencies.append(.complex(module, .interfaces))
        }
        
        return .target(
            name: name,
            destinations: .iOS,
            product: .framework,
            productName: name,
            bundleId: Constants.BUNDLE_ID + "." + name,
            deploymentTargets: .iOS(Constants.MIN_TARGET_IOS),
            infoPlist: .default,
            sources: sources,
            scripts: [.swiftlint(countInnerFolder: countInnerFolder)],
            dependencies: allDependencies,
            coreDataModels: coreDataModels ?? []
        )
    }
}

public enum ComplexTargetType {
    case interfaces
    case impl
}
