import MetalKit

class GameView: MTKView {

    var commandQueue: MTLCommandQueue!;
    var renderPipelineState: MTLRenderPipelineState!;

    required init(coder: NSCoder) {
        super.init(coder: coder)
        // GPU used for the metal shader compilation
        device = MTLCreateSystemDefaultDevice()
        // Color used to clear the screen
        clearColor = MTLClearColor(red: 0.25, green: 0.50, blue: 0.25, alpha: 1.00)
        // No idea really
        colorPixelFormat = .bgra8Unorm
        // Queue of command-buffers ready for drawing
        commandQueue = device?.makeCommandQueue()

        createRenderPipelineState()
    }

    func createRenderPipelineState() {
        // Metal library
        let library = device?.makeDefaultLibrary()
        // Retrieve the two shader functions from the metal lib
        let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
        let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")

        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()

        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction

        do {
            renderPipelineState = try device?.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
        } catch let error as NSError {
            print(error)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        // If it is not possible to get the drawable or the current render-pass, return the statement
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else {
            return
        }
        // Buffer which hold the command
        let commandBuffer = commandQueue.makeCommandBuffer()
        // Encodes the command to a render command
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderCommandEncoder?.setRenderPipelineState(renderPipelineState)

        // Send info to render commander encoder

        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
