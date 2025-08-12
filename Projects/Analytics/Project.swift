import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.Analytics.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            .Analytics,
            dependencies: [
                .simple(.Common)
            ]
        )
    ]
)

