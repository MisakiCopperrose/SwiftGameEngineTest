import MetalKit

enum VertexDescriptorTypes {
    case basic
}

class VertexDescriptorLibrary {

    private static var vertexDescriptors: [VertexShaderTypes: VertexDescriptor] = [:]

    public static func initialize() {

        createDefaultVertexDescriptors()
    }

    private static func createDefaultVertexDescriptors() {

        vertexDescriptors.updateValue(BasicVertexDescriptor(), forKey: .basic)
    }

    public static func descriptor(_ vertexDescriptorType: VertexShaderTypes) -> MTLVertexDescriptor {

        vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor { get }
}

public struct BasicVertexDescriptor: VertexDescriptor {
    var name = "Basic Vertex Descriptor"

    var vertexDescriptor: MTLVertexDescriptor {
        let vertexDescriptor = MTLVertexDescriptor()
        // Position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        // Position
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = MemoryLayout<SIMD3<Float>>.size

        vertexDescriptor.layouts[0].stride = Vertex.stride

        return vertexDescriptor
    }
}
