import MetalKit

enum MeshTypes {

    case triangleMesh
    case quadMesh
}

class MeshLibrary {

    public static var meshes: [MeshTypes: Mesh] = [:]

    public static func initialize() {

        createDefaultMeshes()
    }

    private static func createDefaultMeshes() {

        meshes.updateValue(TriangleMesh(), forKey: .triangleMesh)
        meshes.updateValue(QuadMesh(), forKey: .quadMesh)
    }

    public static func mesh(_ meshType: MeshTypes) -> Mesh {

        meshes[meshType]!
    }
}

// _______________________________________________________________

protocol Mesh {

    var vertexBuffer: MTLBuffer! { get }

    var vertexCount: Int! { get }

}

class CustomMesh: Mesh {

    var vertices: [Vertex]!

    var vertexBuffer: MTLBuffer!

    var vertexCount: Int! {

        vertices.count
    }

    init() {

        createVertices()
        createBuffers()
    }

    func createVertices() {}

    func createBuffers() {
        // Throw the vertices into the vertex shader function
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
}

class TriangleMesh: CustomMesh {

    override func createVertices() {
        vertices = [
            Vertex(position: SIMD3<Float>(0, 1, 0), colour: SIMD4<Float>(1, 0, 0, 1)),
            Vertex(position: SIMD3<Float>(-1, -1, 0), colour: SIMD4<Float>(1, 1, 0, 1)),
            Vertex(position: SIMD3<Float>(1, -1, 0), colour: SIMD4<Float>(1, 0, 1, 1))
        ]
    }
}

class QuadMesh: CustomMesh {

    override func createVertices() {
        vertices = [
            Vertex(position: SIMD3<Float>(1, 1, 0), colour: SIMD4<Float>(1, 0, 0, 1)),
            Vertex(position: SIMD3<Float>(-1, 1, 0), colour: SIMD4<Float>(1, 1, 0, 1)),
            Vertex(position: SIMD3<Float>(-1, -1, 0), colour: SIMD4<Float>(1, 0, 1, 1)),

            Vertex(position: SIMD3<Float>(1, 1, 0), colour: SIMD4<Float>(1, 0, 0, 1)),
            Vertex(position: SIMD3<Float>(-1, -1, 0), colour: SIMD4<Float>(1, 0, 1, 1)),
            Vertex(position: SIMD3<Float>(1, -1, 0), colour: SIMD4<Float>(1, 0, 1, 1))
        ]
    }
}
