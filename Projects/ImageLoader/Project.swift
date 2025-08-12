import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ComplexModule.ImageLoader.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            .ImageLoader,
            target: .impl,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .complex(.Networking, .interfaces)
            ]
        ),
        .complex(
            .ImageLoader,
            target: .interfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)

