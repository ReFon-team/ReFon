import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ComplexModule.DataSources.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            .DataSources,
            target: .impl,
            dependencies: [
                .simple(.Common),
                .complex(.Utilities, .interfaces),
                .complex(.Networking, .interfaces),
                .complex(.Persistance, .interfaces)
            ]
        ),
        .complex(
            .DataSources,
            target: .interfaces,
            dependencies: [
                .simple(.Common)
            ]
        )
    ]
)
