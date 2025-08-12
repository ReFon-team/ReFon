import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.DesignSystem.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            .DesignSystem,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)

