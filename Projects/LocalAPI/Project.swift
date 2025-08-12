import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ComplexModule.LocalAPI.title,
    organizationName: Constants.ORGANIZATION_NAME,
    targets: [
        .complex(
            .LocalAPI,
            target: .impl,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities),
                .complex(.Persistance, .interfaces)
            ],
            coreDataModels: [.coreDataModel(.path("Sources/LocalAPI/Store/Model.xcdatamodeld"))]
        ),
        .complex(
            .LocalAPI,
            target: .interfaces,
            dependencies: [
                .simple(.Common),
                .simple(.CoreEntities)
            ]
        )
    ]
)

