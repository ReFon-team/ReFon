import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.DI.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            .DI,
            dependencies: [
                .simple(.Common)
            ]
        )
    ]
)

