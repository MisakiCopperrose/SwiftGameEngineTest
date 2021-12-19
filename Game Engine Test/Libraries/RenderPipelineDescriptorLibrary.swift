import MetalKit

enum RenderPipelineDescriptorTypes {
    case basic
}

class RenderPipelineDescriptorLibrary {

    private static var renderPipelineDescriptors: [RenderPipelineDescriptorTypes: RenderPipelineDescriptor] = [:]

    public static func initialize() {

        createDefaultRenderPipelineDescriptors()
    }

    private static func createDefaultRenderPipelineDescriptors() {

        renderPipelineDescriptors.updateValue(BasicRenderPipelineDescriptor(), forKey: .basic)
    }

    public static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes) ->
    MTLRenderPipelineDescriptor {

        renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {

    var name: String { get }

    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

public struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {

    var name = "Basic Render Pipeline Descriptor"

    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()

        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.MainPixelFormat

        renderPipelineDescriptor.vertexFunction = ShaderLibrary.vertex(.basic)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.fragment(.basic)

        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(.basic)

        return renderPipelineDescriptor
    }
}
