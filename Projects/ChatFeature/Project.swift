import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.Chat.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .feature(
            feature: .Chat,
            module: .Presentation,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .simple(.DesignSystem),
                .simple(.DI)
            ]
        ),
        .feature(
            feature: .Chat,
            module: .Domain,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Chat,
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
            feature: .Chat,
            module: .DataInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        ),
        .feature(
            feature: .Chat,
            module: .DomainInterfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)

