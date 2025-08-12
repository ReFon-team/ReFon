import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ComplexModule.Networking.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            .Networking,
            target: .impl,
            dependencies: [
                .simple(.Common)
            ]
        ),
        .complex(
            .Networking,
            target: .interfaces,
            dependencies: [
                .simple(.Common)
            ]
        )
    ]
)
