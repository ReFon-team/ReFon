//
//  ComplexModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 09.08.2025.
//

import ProjectDescription

public enum ComplexModule: String, ProjectProtocol {
    case Networking, Persistance, API, LocalAPI, ImageLoader
    
    public var title: String { rawValue }
    
    public var rootFolder: String? {
        self == .Networking || self == .Persistance ? "Packages" : nil
    }
    
    public var path: Path {
        if let folder = rootFolder {
            return Path.relativeToRoot("Projects/\(folder)/\(title)")
        }
        return Path.relativeToRoot("Projects/\(title)")
    }
    
    public var interfacesTargetName: String { title + "Interfaces" }
}
