//
//  ProjectProtocols.swift
//  ProjectDescriptionHelpers
//
//  Created by Вадим Мартыненко on 09.08.2025.
//

import ProjectDescription

public protocol ProjectProtocol {
    var title: String { get }
    var path: Path { get }
}

public extension ProjectProtocol {
    var path: Path {
        Path.relativeToRoot("Projects/\(title)")
    }
}
