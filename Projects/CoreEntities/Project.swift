import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.CoreEntities.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            .CoreEntities,
            dependencies: [
                .simple(.Common)
            ]
        )
    ]
)

