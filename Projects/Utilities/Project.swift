import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ComplexModule.Utilities.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            .Utilities,
            target: .impl,
            dependencies: [
                .simple(.Common),
                .complex(.Networking, .interfaces),
                .complex(.Persistance, .interfaces)
            ]
        ),
        .complex(
            .Utilities,
            target: .interfaces,
            dependencies: [
                .simple(.Common)
            ]
        )
    ]
)
