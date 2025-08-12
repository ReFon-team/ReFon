import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.Profile.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .feature(
            feature: .Profile,
            module: .Presentation,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .simple(.DesignSystem),
                .simple(.DI)
            ]
        ),
        .feature(
            feature: .Profile,
            module: .Domain,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Profile,
            module: .Data,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .complex(.ImageLoader, .interfaces),
                .complex(.API, .interfaces),
                .complex(.LocalAPI, .interfaces)
            ]
        ),
        .feature(
            feature: .Profile,
            module: .DataInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Profile,
            module: .DomainInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)

