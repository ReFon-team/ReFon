import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.Ads.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .feature(
            feature: .Ads,
            module: .Presentation,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .simple(.DesignSystem),
                .simple(.DI)
            ]
        ),
        .feature(
            feature: .Ads,
            module: .Domain,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Ads,
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
            feature: .Ads,
            module: .DataInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Ads,
            module: .DomainInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)

