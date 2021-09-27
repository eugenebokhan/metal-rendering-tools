// swift-tools-version:5.3

import PackageDescription
let package = Package(
    name: "metal-rendering-tools",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "MetalRenderingTools",
            targets: ["MetalRenderingTools"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/eugenebokhan/metal-compute-tools.git",
            .branch("quantize-df")
        )
    ],
    targets: [
        .target(
            name: "MetalRenderingToolsSharedTypes",
            publicHeadersPath: "."
        ),
        .target(
            name: "MetalRenderingTools",
            dependencies: [
                .target(name: "MetalRenderingToolsSharedTypes"),
                .product(
                    name: "MetalComputeTools",
                    package: "metal-compute-tools"
                )
            ],
            resources: [
                .process("Renderers/Common/Common.metal"),
                .process("Renderers/LinesRenderer/LinesRenderer.metal"),
                .process("Renderers/MaskRenderer/MaskRenderer.metal"),
                .process("Renderers/PointsRenderer/PointsRenderer.metal"),
                .process("Renderers/RectangleRender/RectangleRender.metal"),
                .process("Renderers/SimpleGeometryRender/SimpleGeometryRender.metal"),
                .process("Renderers/TextRender/TextRender.metal"),
                .copy("Resources/HelveticaNeue.mtlfontatlas")
            ]
        )
    ]
)
