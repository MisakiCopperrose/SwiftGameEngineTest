import MetalKit

class Renderer: NSObject {

    var gameObjects: [Node] = [ Player() ]
}

extension Renderer: MTKViewDelegate {

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // When the window is resized
    }

    func draw(in view: MTKView) {
        // If it is not possible to get the drawable or the current render-pass, return the statement
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else {
            return
        }
        // Buffer which hold the command
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        // Encodes the command to a render command
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)

        player.render(renderCommandEncoder: renderCommandEncoder!)

        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
