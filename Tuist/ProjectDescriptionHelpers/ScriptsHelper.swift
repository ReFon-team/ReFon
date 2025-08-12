import ProjectDescription

public extension TargetScript {
    static func swiftlint(countInnerFolder: Int = 0) -> Self {
        var path = "../../.swiftlint.yml"
        
        if countInnerFolder > 0 {
            (1..<countInnerFolder).forEach { _ in path = "../" + path }
        }
        
        return .pre(
            path: Path.relativeToRoot("Scripts/swiftlint.sh"),
            arguments: [path],
            name: "SwiftLint",
            basedOnDependencyAnalysis: false
        )
    }
    
    static func swiftgen() -> Self {
        .pre(
            path: Path.relativeToRoot("Scripts/swiftgen.sh"),
            arguments: [],
            name: "SwiftGen",
            basedOnDependencyAnalysis: false
        )
    }
}
