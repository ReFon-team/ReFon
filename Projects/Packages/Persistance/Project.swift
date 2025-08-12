import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ComplexModule.Persistance.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            .Persistance,
            target: .impl,
            dependencies: [
                .simple(.Common)
            ]
        ),
        .complex(
            .Persistance,
            target: .interfaces,
            dependencies: [
                .simple(.Common)
            ]
        )
    ]
)
