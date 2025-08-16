import ProjectDescription
import ProjectDescriptionHelpers

let dependencies: [TargetDependency] = [
    .simple(.DI),
    .simple(.Navigation),
    .simple(.Common),
    .complex(.Networking, .impl),
    .complex(.Networking, .interfaces),
    .complex(.Persistance, .impl),
    .complex(.Persistance, .interfaces),
    .complex(.Utilities, .impl),
    .complex(.Utilities, .interfaces),
    .complex(.DataSources, .impl),
    .complex(.DataSources, .interfaces),
    .simple(.Analytics),
    .simple(.Logger)
]

let featureDependencies: [TargetDependency] = Feature.allDependenciesForApp()

let project = Project(
    name: SimpleModule.App.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            .App,
            resources: Constants.DEFAULT_LOCATE_RESOURCES,
            dependencies: dependencies + featureDependencies
        )
    ]
)
