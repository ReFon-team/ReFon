import ProjectDescription
import ProjectDescriptionHelpers

let dependencies: [TargetDependency] = [
    .simple(.DI),
    .simple(.Navigation),
    .simple(.Common),
    .complex(.Networking, .impl),
    .complex(.Networking, .interfaces),
    .complex(.ImageLoader, .impl),
    .complex(.ImageLoader, .interfaces),
    .complex(.Persistance, .impl),
    .complex(.Persistance, .interfaces),
    .complex(.LocalAPI, .impl),
    .complex(.LocalAPI, .interfaces),
    .complex(.API, .impl),
    .complex(.API, .interfaces),
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
