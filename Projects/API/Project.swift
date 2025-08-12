import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ComplexModule.API.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            .API,
            target: .impl,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .complex(.Networking, .interfaces),
            ]
        ),
        .complex(
            .API,
            target: .interfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)
