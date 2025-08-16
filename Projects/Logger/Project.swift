import ProjectDescription
import ProjectDescriptionHelpers

let dependencies: [TargetDependency] = [
    .simple(.Common),
    .complex(.Utilities, .impl),
    .complex(.Utilities, .interfaces),
    .complex(.DataSources, .impl),
    .complex(.DataSources, .interfaces),
    .complex(.Networking, .impl),
    .complex(.Networking, .interfaces),
    .complex(.Persistance, .impl),
    .complex(.Persistance, .interfaces)
]

let featureDependencies: [TargetDependency] = Feature.allDependenciesForLogger()

let project = Project(
    name: SimpleModule.Logger.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            .Logger,
            dependencies: dependencies + featureDependencies
        )
    ]
)

