import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: SimpleModule.Navigation.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .simple(
            .Navigation,
            dependencies: [
                .simple(.Common),
                .presentation(.Ads),
                .presentation(.Auth),
                .presentation(.Profile),
                .presentation(.Chat)
            ]
        )
    ]
)
