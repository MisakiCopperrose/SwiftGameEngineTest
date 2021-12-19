import MetalKit

class Engine {

    public static var Device: MTLDevice!

    public static var CommandQueue: MTLCommandQueue!

    public static func ignite(device: MTLDevice) {

        Device = device
        CommandQueue = device.makeCommandQueue()

        ShaderLibrary.initialize()

        VertexDescriptorLibrary.initialize()

        RenderPipelineDescriptorLibrary.initialize()

        RenderPipelineStateLibrary.initialize()

        MeshLibrary.initialize()
    }
}
