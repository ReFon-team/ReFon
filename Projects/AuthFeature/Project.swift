import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.Auth.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .feature(
            feature: .Auth,
            module: .Presentation,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .simple(.DesignSystem),
                .simple(.DI)
            ]
        ),
        .feature(
            feature: .Auth,
            module: .Domain,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Auth,
            module: .Data,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .complex(.DataSources, .interfaces)
            ]
        ),
        .feature(
            feature: .Auth,
            module: .DataInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Auth,
            module: .DomainInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)

